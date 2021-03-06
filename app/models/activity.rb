class Activity < ActiveRecord::Base

  hobo_model # Don't put anything above this
  
  PublicationStatus  = HoboFields::Types::EnumString.for(:public, :private)

  # standard owner and admin permissions
  # defined in models/standard_permissions.rb
  include SgMarshal
  
  fields do
    name        :string, :required
    author_name :string
    publication_status Activity::PublicationStatus, :default => 'private'
    timestamps
  end 

  has_many   :pages, :order => :position
  belongs_to :owner, :class_name => "User"
  children   :pages, :data_sets
  
  has_many   :activity_grade_levels, :dependent => :destroy
  has_many   :grade_levels, :through => :activity_grade_levels, :accessible => true

  has_many   :activity_subject_areas, :dependent => :destroy
  has_many   :subject_areas, :through => :activity_subject_areas, :accessible => true

  has_many   :data_sets
  
  def to_hash
    {
      'type' => 'Activity',
      'name' => name,
      'authorName' => author_name,
      'pages' => pages.map(&:to_hash),
      'datasets' => data_sets.map(&:to_hash),
      'units' => Unit.find(:all).map(&:to_hash)
    }
  end

  def after_user_new
    self.owner = acting_user
    self.author_name ||= acting_user.name
  end

  def copy_activity(user = self.owner)
    hash_rep = self.to_hash
    the_copy = Activity.from_hash(hash_rep)
    the_copy.owner = user
    the_copy.save
    return the_copy
  end
  
  def is_owner?(user=acting_user)
    return self.owner_is? user
  end

  def create_permitted?
    acting_user.signed_up?
  end

  def update_permitted?
   return true if acting_user.administrator?
   return true if self.is_owner?
   return false
  end

  def destroy_permitted?
   return true if acting_user.administrator?
   return true if self.is_owner?
   return false
  end

  def view_permitted?(field)
    true
  end

  def datasets_from_hash(definitions)
    self.data_sets = definitions.map {|d| DataSet.from_hash(d)}
  end

  def edit_permitted?(attribute)
    return true if acting_user.administrator?
    return false if attribute == :owner
    return self.is_owner?
  end

  def extract_graphs
    graphs = self.pages.map { |p| [p.predefined_graph_panes,p.prediction_graph_panes,p.sensor_graph_panes]}
    graphs.flatten!
  end
end