class Section < ActiveRecord::Base

  include PositionMover
  
  attr_accessible :name, :position, :visible, :content, :content_type, :page_id
  
  belongs_to :page
  has_many :section_edits
  has_many :editors, :through => :section_edits, :class_name => "AdminUser"

	CONTENT_TYPES = ['Text', 'HTML']

  # validates_presence_of :name
  # validates_length_of :name, :maximum => 255
  # validates_inclusion_of :content_type, :in => CONTENT_TYPES, 
  # 	:message => "tem que ser dos tipos: #{CONTENT_TYPES.join(', ')}"
  # validates_presence_of :content

  validates :name, :presence => true, :length => {:maximum => 255}
  validates :content_type, :inclusion => {:in => CONTENT_TYPES}
  validates :content, :presence => true

  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :sorted, order('sections.position ASC')
  
  def position_scope   
    "sections.page_id = #{page_id.to_i} "
  end

end
