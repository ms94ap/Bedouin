module CompaniesHelper
  
  def established_year
    dates = 1800..Date.today.year
    dates.collect{ |y| [y.to_i,y.to_i]}.reverse
  end

  def year_select
    dates = 1950..Date.today.year
    dates.collect{ |y| [y.to_i,y.to_i]}.reverse
  end
end
