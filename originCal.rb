require 'time'
require 'date'

class Calendar
  @@weekOffset = 1
  @@x = 1
  @@y = 0
  @@calArray=Array.new(7).map!{Array.new}
  def initialize
    (0..6).each do |i|
      @@calArray[0][i]=Date.new(2012,4,i+@@weekOffset).strftime("%a")
    end
  end
  
  def setDate(x,y,date)
    @@calArray[x][y]=date
    if date == 1 then
      @@y = y
    end
    if y==6 then
      @@x = @@x + 1
      @@y = 0
    else
      @@y = @@y + 1
    end
  end
  
  def createMonth(thisYear,myMonth)
    @f_date=Date.new(thisYear,myMonth,1)
    @l_date=Date.new(thisYear,myMonth,-1)
    (@f_date..@l_date).each do |i|
      if i.day == 1
        case i.strftime("%a")
        when "Sun"
          setDate(1,0,i.day)
        when "Mon"
          setDate(1,1,i.day)
        when "Tue"
          setDate(1,2,i.day)
        when "Wed"
          setDate(1,3,i.day)
        when "Thu"
          setDate(1,4,i.day)
        when "Fri"
          setDate(1,5,i.day)
        when "Sat"
          setDate(1,6,i.day)
        end
      else
        setDate(@@x,@@y,i.day)
      end
    end
    return @@calArray
  end
end

hoge = Calendar.new
huga = hoge.createMonth(2012,ARGV[0].to_i)
p huga
