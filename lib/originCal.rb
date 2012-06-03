require 'date'
require 'time'
require 'pp'

class Calendar 
  def initialize
    @x = 0
    @y = 0
    @cal_array=Array.new(7).map!{Array.new}
    @day_of_date={"Sun" => 0,"Mon" => 1, "Tue" => 2, "Wed" => 3, "Thu" => 4, "Fri" => 5, "Sat" => 6}
    @day_of_date.each{|key,val|
      @cal_array[@x][val]=key
    }
    @x = @x + 1
  end
  
  def setDate(x,y,a_day)
    if a_day.day == 1 then
      @cal_array[@x][@day_of_date["#{a_day.strftime("%a")}"]]=a_day
      @y = @day_of_date["#{a_day.strftime("%a")}"]
    else 
      @cal_array[@x][@y]=a_day
    end
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
end
