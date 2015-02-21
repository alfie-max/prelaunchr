# Export to CSV with the referrer_id
ActiveAdmin.register User do
  csv do
    column :id
    column :email
    column :referral_code
    column :referrer_id
    column :created_at
    column :updated_at
    column "referals" do |user|
      user.referrals.count
    end
  end

  filter :referrer, as: :select, collection: proc {User.all.map{|u| [u.email, u.id]}}
  filter :email
  filter :referral_code
  filter :created_at
  filter :updated_at

  actions :index, :show
end
