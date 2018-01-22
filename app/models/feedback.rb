class Feedback < ActiveRecord::Base

  has_crud settings: true



  dragonfly_accessor  :image # this needs a `image_uid` field on the SuperHero model




  crud.config do
    map image_uid: :image

    fields image: { type: :image   },
           image_upload:         { type: :uploader, croppable: true, ratio: "2/1" },
           image_upload_id:      { type: :uploader },
           feel_well_informed:   { type: :boolean  },
           aware_of_rights:      { type: :boolean  },
           wish_to_be_contacted: { type: :boolean  },
           read_it_in_booklet:   { type: :boolean  },
           read_it_in_brochure:  { type: :boolean  },
           read_it_in_directory: { type: :boolean  },
           understand_rights:    { type: :boolean  }

    form fields: [:image, :image_upload, :room_number, :positive_aspects, :could_do_better, :feel_well_informed, :please_comment, :aware_of_rights, :read_it_in_booklet, :read_it_in_brochure, :read_it_in_directory, :understand_rights, :other_comments, :first_name, :last_name, :email, :address, :telephone, :involved_in_forum, :ward_or_department, :wish_to_be_contacted]

    config :admin do
      actions only:  [:index, :show]
      index fields: [:room_number, :first_name, :last_name, :ward_or_department, :wish_to_be_contacted],
        order:  { created_at: :desc }

      show fields: [:image, :room_number, :positive_aspects, :could_do_better, :feel_well_informed, :please_comment, :aware_of_rights, :read_it_in_booklet, :read_it_in_brochure, :read_it_in_directory, :understand_rights, :other_comments, :first_name, :last_name, :email, :address, :telephone, :involved_in_forum, :ward_or_department, :wish_to_be_contacted]

      #csv  fields: [:room_number, :positive_aspects, :could_do_better, :feel_well_informed, :please_comment, :aware_of_rights, :read_it_in_booklet, :read_it_in_brochure, :read_it_in_directory, :understand_rights, :other_comments, :first_name, :last_name, :email, :address, :telephone, :involved_in_forum, :ward_or_department, :wish_to_be_contacted]
    end
  end

end
