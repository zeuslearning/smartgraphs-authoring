class Activity < ActiveRecord::Base

  hobo_model # Don't put anything above this
  
  # standard owner and admin permissions
  # defined in models/standard_permissions.rb
  include StandardPermissions
  
  fields do
    name        :string
    author_name :string
    timestamps
  end 

  has_many :pages, :order => :position
  children :pages

  def to_hash
    {
      'type' => 'Activity',
      'name' => name,
      'authorName' => author_name,
      'pages' => pages.map(&:to_hash),
      'units' => Unit.find(:all).map(&:to_hash)
    }
  end

end