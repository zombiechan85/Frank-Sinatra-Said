require 'date'
require 'time'

class Calendar 
  def initialize
    @x = 0
    @y = 0
    @cal_array=Array.new(7).map!{Array.new}
    @day_of_date={"Sun" => 0,"Mon" => 1, "Tue" => 2, "Wed" => 3, "Thu" => 4, "Fri" => 5, "Sat" => 6}
  end
  
  def setDate(x,y,a_day)
    if a_day.day == 1 then
      @y = @day_of_date["#{a_day.strftime("%a")}"]
    end
      @cal_array[@x][@y] = a_day
    if a_day.strftime("%a")=="Sat" then
      @x = @x + 1
      @y = 0
    else
      @y = @y + 1
    end
  end
    
  def createMonth(this_year,my_month)
    f_date=Date.new(this_year,my_month,1)
    l_date=Date.new(this_year,my_month,-1)
    (f_date..l_date).each do |i|
      setDate(@x, @y, i)
    end
    return @cal_array
  end
  
  def get_week
    return @day_of_date
  end
  
end
