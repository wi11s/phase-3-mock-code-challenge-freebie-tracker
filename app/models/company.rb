class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        Freebie.create(item_name: item_name, dev_id: dev.id, value: value)
    end

    def self.oldest_company
        self.order(:founding_year).first
    end
end
