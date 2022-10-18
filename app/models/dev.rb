class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def freebie_names
        freebies.map do |f|
            f.item_name
        end
    end

    def received_one?(item_name)
        freebie_names = []
        self.freebies.map do |f|
            freebie_names << f.item_name
        end

        if freebie_names.include?(item_name)
            true
        else
            false
        end
    end

    def give_away(dev, freebie)
        if self.received_one?(freebie.item_name)
            freebie.update(dev_id: dev.id)
        else
            "You can't give someone else's shit away"
        end
    end
end
