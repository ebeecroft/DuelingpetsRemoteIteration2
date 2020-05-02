module UserupgradesHelper

   private
      def getUpgradeParams(type)
         value = ""
         if(type == "Id")
            value = params[:id]
         elsif(type == "Upgrade")
            value = params.require(:userupgrade).permit(:name, :base, :baseinc, :price,
            :freecap, :membercap)
         elsif(type == "Page")
            value = params[:page]
         else
            raise "Invalid type detected!"
         end
         return value
      end

      def getUpgrades(buytype, upgradetype, pouch, upgrade)
         upgrade = Userupgrade.find_by_id(upgrade)
         #pouch is necessary
         if(upgradetype == "Cost")
            if(buytype == "Pouch")
               level = pouch.pouchlevel
            elsif(buytype == "OC")
               level = pouch.oclevel
            elsif(buytype == "Blog")
               level = pouch.bloglevel
            elsif(buytype == "Emerald")
               level = pouch.emeraldlevel
            elsif(buytype == "Dreyterrium")
               level = pouch.dreyterriumlevel
            end
            upgrademax = upgrade.freecap
            #if(type)
               #upgrademax = upgrade.membercap
            #end
            if(level < upgrademax)
               cost = upgrade.price * (level + 1) #Should not be < 0
            end
         elsif(upgradetype == "Limit" || upgradetype == "Max")
            #Need to know which upgrade to use
            #allso need to seperate maybe
            level = 0
            if(buytype == "Pouch")
               level = pouch.pouchlevel
            elsif(buytype == "OC")
               level = pouch.oclevel
            elsif(buytype == "Blog")
               level = pouch.bloglevel
            elsif(buytype == "Emerald")
               level = pouch.emeraldlevel
            elsif(buytype == "Dreyterrium")
               level = pouch.dreyterriumlevel
            end
            cost = upgrade.base + (upgrade.baseinc * level)
            if(upgradetype == "Max")
               #add membercap later
               cost = upgrade.freecap
            end
         end
         return cost
      end

      def upgradeUser(buytype)
         logged_in = current_user
         pouchFound = Pouch.find_by_id(params[:pouch_id])
         if((logged_in && pouchFound) && (logged_in.id == pouchFound.user_id))
            price = getUpgrades(buytype, "Cost", pouchFound)
            if(price != 0 && (pouchFound.amount - price > -1))
               pouchFound.amount -= price
               message1 = ""
               message2 = ""
               if(buytype == "Pouch")
                  pouchFound.pouchlevel += 1
                  message1 = "pouch"
                  message2 = "#{pouchFound.pouchlevel}"
               elsif(buytype == "OC")
                  pouchFound.oclevel += 1
                  message1 = "oc"
                  message2 = "#{pouchFound.oclevel}"
               elsif(buytype == "Blog")
                  pouchFound.bloglevel += 1
                  message1 = "blog"
                  message2 = "#{pouchFound.bloglevel}"
               elsif(buytype == "Emerald")
                  pouchFound.emeraldlevel += 1
                  message1 = "emerald"
                  message2 = "#{pouchFound.emeraldlevel}"
               elsif(buytype == "Dreyterrium")
                  pouchFound.dreyterriumlevel += 1
                  message1 = "dreyore"
                  message2 = "#{pouchFound.dreyterriumlevel}"
               end
               @pouch = pouchFound
               @pouch.save
               flash[:success] = "Your " + message1 + " level is now: " + message2
               redirect_to user_path(@pouch.user.vname)
            else
               if(price == 0)
                  message = "You have already upgraded this feature to the max."
               else
                  message = "Insufficient points to pay for this upgrade!"
               end
               flash[:error] = message
               redirect_to user_path(pouchFound.user.vname)
            end
         else
            redirect_to root_path
         end
      end

      def mode(type)
         if(timeExpired)
            logout_user
            redirect_to root_path
         else
            if(type == "index")
               if(current_user && current_user.pouch.privilege == "Admin")
                  removeTransactions
                  allUpgrades = Userupgrade.order("id asc")
                  @userupgrades = Kaminari.paginate_array(allUpgrades).page(getUpgradeParams("Page")).per(10)
               end
            elsif(type == "new" || type == "create")
               if(current_user && current_user.pouch.privilege == "Admin")
                  newUpgrade = Userupgrade.new
                  if(type == "create")
                     newUpgrade = Userupgrade.new(getUpgradeParams("Upgrade"))
                     newUpgrade.created_on = currentTime
                     newUpgrade.updated_on = currentTime
                  end
                  @userupgrade = newUpgrade

                  if(type == "create")
                     if(@userupgrade.save)
                        flash[:success] = "Upgrade #{@userupgrade.name} was successfully created."
                        redirect_to userupgrades_path
                     else
                        render "new"
                     end
                  end
               end
            elsif(type == "edit" || type == "update")
               if(current_user && current_user.pouch.privilege == "Admin")
                  upgradeFound = Userupgrade.find_by_id(getUpgradeParams("Id"))
                  if(upgradeFound)
                     upgradeFound.updated_on = currentTime
                     @userupgrade = upgradeFound
                     if(type == "update")
                        if(@userupgrade.update_attributes(getUpgradeParams("Upgrade")))
                           flash[:success] = "Upgrade #{@userupgrade.name} was successfully updated."
                           redirect_to userupgrades_path
                        else
                           render "edit"
                        end
                     end
                  else
                     render "webcontrols/crazybat"
                  end
               end
            elsif(type == "upgrade")
               buytype = params[:buyname]
               upgradeUser(buytype)
            end
         end
      end
end
