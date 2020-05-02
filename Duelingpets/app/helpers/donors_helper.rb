module DonorsHelper

   private
      def getDonorParams(type)
         value = ""
         if(type == "Id")
            value = params[:id]
          elsif(type == "DonorId")
            value = params[:donor_id]
         elsif(type == "Donor")
            value = params.require(:donor).permit(:description, :amount)
         elsif(type == "Page")
            value = params[:page]
         else
            raise "Invalid type detected!"
         end
         return value
      end

      def mode(type)
         if(timeExpired)
            logout_user
            redirect_to root_path
         else
            if(type == "index")
               logged_in = current_user
               if(logged_in && logged_in.pouch.privilege == "Admin")
                  removeTransactions
                  allDonors = Donor.order("updated_on desc, created_on desc")
                  @donors = Kaminari.paginate_array(allDonors).page(getDonorParams("Page")).per(10)
               else
                  redirect_to root_path
               end
            elsif(type == "new" || type == "create")
               allMode = Maintenancemode.find_by_id(1)
               userMode = Maintenancemode.find_by_id(6)
               if(allMode.maintenance_on || userMode.maintenance_on)
                  if(allMode.maintenance_on)
                     render "/start/maintenance"
                  else
                     render "/users/maintenance"
                  end
               else
                  editCommons(type)
                  logged_in = current_user
                  donationboxFound = Donationbox.find_by_id(params[:donationbox_id])
                  if((logged_in && donationboxFound) && (logged_in.id != donationboxFound.user.id))
                     if(donationboxFound.box_open)
                        newDonor = donationboxFound.donors.new
                        if(type == "create")
                           newDonor = donationboxFound.donors.new(getDonorParams("Donor"))
                           newDonor.created_on = currentTime
                           newDonor.updated_on = currentTime
                           newDonor.user_id = logged_in.id
                           newDonor.capacity = 50000
                        end
                        @donor = newDonor
                        @donationbox = donationboxFound
                        if(type == "create")
                           points = @donationbox.progress + @donor.amount
                           if((@donor.amount <= @donor.capacity) && (logged_in.pouch.amount - @donor.amount >= 0) && (points <= @donationbox.capacity))
                              if(@donor.save)
                                 logged_in.pouch.amount -= @donor.amount
                                 @pouch = logged_in.pouch
                                 @pouch.save
                                 @donationbox.progress += @donor.amount
                                 if(@donationbox.progress >= @donationbox.goal && !@donationbox.hitgoal)
                                    @donationbox.hitgoal = true
                                    profit = @donationbox.progress - @donationbox.goal
                                    CommunityMailer.donations(@donor, "Goal", profit).deliver_now
                                 end
                                 @donationbox.save
                                 CommunityMailer.donations(@donor, "Donated", @donor.amount).deliver_now
                                 flash[:success] = "#{@donor.user.vname}'s donation was successfully added!"
                                 redirect_to user_path(@donationbox.user)
                              else
                                 render "new"
                              end
                           else
                              message = ""
                              if(@donor.amount > @donor.capacity)
                                 message = "You exceeded the donor capacity of #{@donor.capacity} points!"
                              elsif(points > @donationbox.capacity)
                                 message = "You exceeded the donationbox capacity of #{@donationbox.capacity} points!"
                              else
                                 message = "You don't have that amount of points to donate!"
                              end
                              flash[:error] = message
                              redirect_to user_path(@donationbox.user)
                           end
                        end
                     else
                        flash[:error] = "User's donationbox is not open at this time!"
                        redirect_to root_path
                     end
                  else
                     redirect_to root_path
                  end
               end
            end
         end
      end
end
