class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        self.freebies << Freebie.new(item_name: item_name, value: value, dev: dev)
    end

    def self.oldest_company
        Company.all.min { |a, b| a.founding_year<=>b.founding_year }
    end
end
