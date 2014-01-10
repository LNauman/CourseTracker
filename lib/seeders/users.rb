require 'csv'

module Seeders
  module Users
    class << self

      def users
        users = []
        CSV.foreach("#{Rails.root}/db/data/users.csv",
          headers: true,
          header_converters: :symbol) do |row|
          users << row.to_hash
        end
        users
      end
      def seed
        Seeders::Users.users.each do |user|
          entry = User.find_by(email: user[:email])
          if entry.nil?
            entry = User.new(user)
          else
            entry.update_attributes(user)
          end
          entry.save!
        end
      end
    end
  end
end
