module ApplicationHelper
  
   #Return the logo reference
   def logo
    image_tag("logo.png", :alt => "Boolco Sample App", :class => "round")
   end

   # Return a title on a per-page basis.
   def title
    base_title = "Boolco Sample App"

    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
    
   end
   
   

   
end
