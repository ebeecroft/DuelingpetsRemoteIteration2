# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_18_004540) do

  create_table "accounttypes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artpages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "message"
    t.datetime "created_on"
    t.string "art"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "baseincs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "amount"
    t.datetime "created_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "baserates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.float "amount", limit: 53
    t.datetime "created_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blacklisteddomains", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_on"
    t.boolean "domain_only", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blacklistednames", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blogs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "ogg"
    t.string "mp3"
    t.string "adbanner"
    t.string "admascot"
    t.string "largeimage1"
    t.string "largeimage2"
    t.string "largeimage3"
    t.string "smallimage1"
    t.string "smallimage2"
    t.string "smallimage3"
    t.string "smallimage4"
    t.string "smallimage5"
    t.datetime "created_on"
    t.datetime "reviewed_on"
    t.datetime "updated_on"
    t.integer "blogtype_id"
    t.integer "bookgroup_id"
    t.integer "blogviewer_id"
    t.integer "user_id"
    t.boolean "largeimage1purchased", default: false
    t.boolean "largeimage2purchased", default: false
    t.boolean "largeimage3purchased", default: false
    t.boolean "smallimage1purchased", default: false
    t.boolean "smallimage2purchased", default: false
    t.boolean "smallimage3purchased", default: false
    t.boolean "smallimage4purchased", default: false
    t.boolean "smallimage5purchased", default: false
    t.boolean "musicpurchased", default: false
    t.boolean "adbannerpurchased", default: false
    t.boolean "pointsreceived", default: false
    t.boolean "reviewed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blogtypes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blogviewers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookgroups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.integer "user_id"
    t.integer "bookgroup_id"
    t.integer "bookworld_id"
    t.boolean "collab_mode", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookworlds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.integer "user_id"
    t.boolean "open_world", default: false
    t.boolean "privateworld", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "channels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "ogg"
    t.string "mp3"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.integer "user_id"
    t.integer "bookgroup_id"
    t.boolean "music_on", default: false
    t.boolean "privatechannel", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chapters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "story"
    t.string "bookcover"
    t.string "storyscene1"
    t.string "voice1ogg"
    t.string "voice1mp3"
    t.string "voice2ogg"
    t.string "voice2mp3"
    t.string "voice3ogg"
    t.string "voice3mp3"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.datetime "reviewed_on"
    t.integer "user_id"
    t.integer "bookgroup_id"
    t.integer "book_id"
    t.integer "gchapter_id", default: 1
    t.boolean "reviewed", default: false
    t.boolean "pointsreceived", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colorschemes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "colortype"
    t.text "description"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.integer "user_id"
    t.boolean "activated", default: false
    t.boolean "democolor", default: false
    t.string "backgroundcolor"
    t.string "headercolor"
    t.string "textcolor"
    t.string "defaultbuttoncolor"
    t.string "defaultbuttonbackgcolor"
    t.string "editbuttoncolor"
    t.string "editbuttonbackgcolor"
    t.string "destroybuttoncolor"
    t.string "destroybuttonbackgcolor"
    t.string "submitbuttoncolor"
    t.string "submitbuttonbackgcolor"
    t.string "navigationcolor"
    t.string "navigationlinkcolor"
    t.string "navigationhovercolor"
    t.string "navigationhoverbackgcolor"
    t.string "onlinestatuscolor"
    t.string "profilecolor"
    t.string "profilevisitedcolor"
    t.string "profilehovercolor"
    t.string "profilehoverbackgcolor"
    t.string "sessioncolor"
    t.string "navlinkcolor"
    t.string "navlinkhovercolor"
    t.string "navlinkhoverbackgcolor"
    t.string "explanationborder"
    t.string "explanationbackgcolor"
    t.string "explanheadercolor"
    t.string "explanheaderbackgcolor"
    t.string "errorfieldcolor"
    t.string "errorcolor"
    t.string "warningcolor"
    t.string "notificationcolor"
    t.string "successcolor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "creatures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image"
    t.string "ogg"
    t.string "mp3"
    t.string "voiceogg"
    t.string "voicemp3"
    t.integer "level"
    t.integer "hp"
    t.integer "atk"
    t.integer "def"
    t.integer "agility"
    t.integer "strength"
    t.integer "mp"
    t.integer "matk"
    t.integer "mdef"
    t.integer "magi"
    t.integer "mstr"
    t.integer "hunger"
    t.integer "thirst"
    t.integer "fun"
    t.integer "lives"
    t.integer "rarity"
    t.boolean "unlimitedlives", default: false
    t.boolean "retiredpet", default: false
    t.boolean "starter", default: false
    t.integer "emeraldcost"
    t.integer "cost"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.datetime "reviewed_on"
    t.integer "user_id"
    t.integer "creaturetype_id"
    t.boolean "pointsreceived", default: false
    t.boolean "reviewed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "creaturetypes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_on"
    t.integer "basecost"
    t.integer "dreyterriumcost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "difficulties", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "pointdebt", default: 0
    t.integer "pointloan", default: 0
    t.integer "emeralddebt", default: 0
    t.integer "emeraldloan", default: 0
    t.datetime "created_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donationboxes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "description"
    t.integer "progress"
    t.integer "goal"
    t.integer "capacity"
    t.datetime "initialized_on"
    t.integer "user_id"
    t.boolean "hitgoal", default: false
    t.boolean "box_open", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "description"
    t.integer "amount"
    t.integer "capacity"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.integer "user_id"
    t.integer "donationbox_id"
    t.boolean "pointsreceived", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dragonhoards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "message"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string "ogg"
    t.string "mp3"
    t.integer "basecost"
    t.float "baserate", limit: 53
    t.integer "treasury", default: 0
    t.integer "contestpoints", default: 0
    t.integer "vacationpoints", default: 0
    t.integer "profit", default: 0
    t.integer "emeralds", default: 0
    t.boolean "denholiday", default: false
    t.string "dragonimage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dreyores", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "cur", default: 0
    t.integer "cap"
    t.integer "baseinc"
    t.integer "change"
    t.integer "price"
    t.integer "extracted", default: 0
    t.datetime "created_on"
    t.datetime "updated_on"
    t.integer "dragonhoard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "economies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "econtype"
    t.string "content_type"
    t.integer "amount"
    t.datetime "created_on"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fieldcosts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "amount"
    t.string "econtype"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.integer "baseinc_id"
    t.integer "dragonhoard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gameinfos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "difficulty_id"
    t.boolean "lives_enabled", default: false
    t.boolean "ageing_enabled", default: false
    t.datetime "activated_on"
    t.boolean "startgame", default: false
    t.boolean "gamecompleted", default: false
    t.integer "success", default: 0
    t.integer "failure", default: 0
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gchapters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.datetime "created_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "itemart"
    t.integer "hp"
    t.integer "atk"
    t.integer "def"
    t.integer "agility"
    t.integer "strength"
    t.integer "mp"
    t.integer "matk"
    t.integer "mdef"
    t.integer "magi"
    t.integer "mstr"
    t.integer "hunger"
    t.integer "thirst"
    t.integer "fun"
    t.integer "durability"
    t.integer "rarity"
    t.boolean "retireditem", default: false
    t.boolean "starter", default: false
    t.boolean "equipable", default: false
    t.integer "emeraldcost"
    t.integer "cost"
    t.datetime "created_on"
    t.datetime "reviewed_on"
    t.datetime "updated_on"
    t.integer "user_id"
    t.integer "itemtype_id"
    t.boolean "pointsreceived", default: false
    t.boolean "reviewed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itemtypes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_on"
    t.integer "basecost"
    t.integer "dreyterriumcost"
    t.boolean "demoitem", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jukeboxes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "ogg"
    t.string "mp3"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.integer "user_id"
    t.integer "bookgroup_id"
    t.boolean "music_on", default: false
    t.boolean "privatejukebox", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mainplaylists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.integer "user_id"
    t.integer "channel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mainsheets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.integer "user_id"
    t.integer "jukebox_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maintenancemodes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_on"
    t.boolean "maintenance_on", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "ogv"
    t.string "mp4"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.datetime "reviewed_on"
    t.integer "user_id"
    t.integer "bookgroup_id"
    t.integer "subplaylist_id"
    t.boolean "reviewed", default: false
    t.boolean "pointsreceived", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ocs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "nickname"
    t.string "species"
    t.integer "age"
    t.text "personality"
    t.text "likesanddislikes"
    t.text "backgroundandhistory"
    t.text "relatives"
    t.text "family"
    t.text "friends"
    t.text "world"
    t.string "alignment"
    t.text "alliance"
    t.text "elements"
    t.text "appearance"
    t.text "clothing"
    t.text "accessories"
    t.string "image"
    t.string "ogg"
    t.string "mp3"
    t.string "voiceogg"
    t.string "voicemp3"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.datetime "reviewed_on"
    t.boolean "reviewed", default: false
    t.boolean "pointsreceived", default: false
    t.integer "user_id"
    t.integer "bookgroup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pmboxes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "capacity"
    t.boolean "box_open", default: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pmreplies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "message"
    t.string "image"
    t.string "ogg"
    t.string "mp3"
    t.string "ogv"
    t.string "mp4"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.integer "user_id"
    t.integer "pm_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "message"
    t.string "image"
    t.string "ogg"
    t.string "mp3"
    t.string "ogv"
    t.string "mp4"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.boolean "user1_unread", default: false
    t.boolean "user2_unread", default: false
    t.integer "user_id"
    t.integer "pmbox_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pouches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.string "privilege", default: "User"
    t.boolean "admin", default: false
    t.boolean "demouser", default: false
    t.boolean "banned", default: false
    t.string "remember_token"
    t.datetime "expiretime"
    t.boolean "activated", default: false
    t.datetime "signed_in_at"
    t.datetime "last_visited"
    t.datetime "signed_out_at"
    t.boolean "gone", default: false
    t.integer "amount", default: 0
    t.integer "emeraldamount", default: 0
    t.integer "dreyterriumamount", default: 0
    t.integer "pouchlevel", default: 0
    t.integer "oclevel", default: 0
    t.integer "bloglevel", default: 0
    t.integer "emeraldlevel", default: 0
    t.integer "dreyterriumlevel", default: 0
    t.boolean "firstdreyterrium", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pouchtypes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratecosts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.float "amount", limit: 53
    t.string "econtype"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.integer "baserate_id"
    t.integer "dragonhoard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "referrals", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_on"
    t.integer "user_id"
    t.integer "referred_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registrations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "country"
    t.string "country_timezone"
    t.date "birthday"
    t.text "message"
    t.integer "accounttype_id"
    t.boolean "shared", default: false
    t.string "login_id"
    t.string "vname"
    t.datetime "registered_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shoutboxes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "capacity"
    t.boolean "box_open", default: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shouts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "message"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.datetime "reviewed_on"
    t.integer "user_id"
    t.integer "shoutbox_id"
    t.boolean "reviewed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sounds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "ogg"
    t.string "mp3"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.datetime "reviewed_on"
    t.integer "user_id"
    t.integer "bookgroup_id"
    t.integer "subsheet_id"
    t.boolean "reviewed", default: false
    t.boolean "pointsreceived", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subplaylists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.integer "user_id"
    t.integer "mainplaylist_id"
    t.boolean "collab_mode", default: false
    t.boolean "fave_folder", default: false
    t.boolean "privatesubplaylist", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subsheets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.integer "user_id"
    t.integer "mainsheet_id"
    t.boolean "collab_mode", default: false
    t.boolean "fave_folder", default: false
    t.boolean "privatesubsheet", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suspendedtimelimits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "pointfines", default: 0
    t.integer "emeraldfines", default: 0
    t.datetime "timelimit"
    t.text "reason"
    t.datetime "created_on"
    t.integer "user_id"
    t.integer "from_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userinfos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "avatar"
    t.string "miniavatar"
    t.string "mp3"
    t.string "ogg"
    t.boolean "music_on", default: false
    t.boolean "mute_on", default: false
    t.string "audiobrowser", default: "ogg"
    t.string "videobrowser", default: "ogv"
    t.boolean "militarytime", default: false
    t.integer "bookgroup_id"
    t.text "info"
    t.integer "user_id"
    t.integer "daycolor_id"
    t.integer "nightcolor_id"
    t.boolean "admincontrols_on", default: false
    t.boolean "reviewercontrols_on", default: false
    t.boolean "keymastercontrols_on", default: false
    t.boolean "managercontrols_on", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "country"
    t.string "country_timezone"
    t.date "birthday"
    t.string "login_id"
    t.string "vname"
    t.integer "accounttype_id"
    t.boolean "shared", default: false
    t.datetime "joined_on"
    t.datetime "registered_on"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userupgrades", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "base"
    t.integer "baseinc"
    t.integer "price"
    t.integer "freecap"
    t.integer "membercap"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "webcontrols", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_on"
    t.string "banner"
    t.string "mascot"
    t.string "favicon"
    t.integer "daycolor_id"
    t.integer "nightcolor_id"
    t.string "ogg"
    t.string "mp3"
    t.string "criticalogg"
    t.string "criticalmp3"
    t.string "betaogg"
    t.string "betamp3"
    t.string "grandogg"
    t.string "grandmp3"
    t.string "creationogg"
    t.string "creationmp3"
    t.string "maintenanceogg"
    t.string "maintenancemp3"
    t.string "missingpageogg"
    t.string "missingpagemp3"
    t.boolean "gate_open", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
