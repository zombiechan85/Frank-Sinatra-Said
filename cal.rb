require "date"

def create_month(calendar=Array.new(7).map!{Array.new},this_year=2012,mymonth)
  @week_offset=7
  @x = 1
  @y = 0
  (0..6).each do |day|
    calendar[0][day]=Date.new(2012,5,day.to_i+@week_offset).strftime('%a')
  end
  
  first_day=Date.new(this_year,mymonth,1)
  last_day=Date.new(this_year,mymonth,-1)
  print("-------", mymonth, "-------\n")
  (first_day..last_day).each do |day|
    if day.day == 1 && day.strftime('%a')=='Mon' then
      @y = 0
    elsif day.day == 1 && day.strftime('%a')=='Tue' then
      @y = 1
    elsif day.day == 1 && day.strftime('%a')=='Wed' then
      @y = 2
    elsif day.day == 1 && day.strftime('%a')=='Thu' then
      @y = 3
    elsif day.day == 1 && day.strftime('%a')=='Fri' then
      @y = 4
    elsif day.day == 1 && day.strftime('%a')=='Sat' then
      @y = 5
    elsif day.day == 1 && day.strftime('%a')=='Sun' then
      @y = 6
    end

    if day.strftime('%a')=='Sun' then
      p day.day
      calendar[@x][6]=day.day
      @x=@x+1
      @y=0
    else
      calendar[@x][@y]=day.day
      @y=@y+1
    end
  end
  return calendar
end
cal = create_month(ARGV[0].to_i)
p cal
