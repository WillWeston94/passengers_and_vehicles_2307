class Park
  attr_reader :name,
              :admission_price

  def initialize(park_attributes)
    @name = park_attributes[:name]
    @admission_price = park_attributes[:admission_price]
  end
end











#  Each park can calculate `revenue` generated.
#  Revenue is generated by charging the admission price per adult