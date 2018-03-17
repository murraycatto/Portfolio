module ApplicationHelper
  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: style) +
      " ".html_safe +
      (link_to "Login", new_user_session_path, class: style)
    else
      link_to "Logout", destroy_user_session_path, class: style
    end
  end

   def source_helper(layout_name)
     if session[:source]
       greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
       content_tag(:p, greeting, class: "source-greeting")
     end
   end

   

   def nav_helper style, tag_type
     nav_links = <<~NAV
      <#{tag_type}>
        <a href="#{root_path}" class="#{style} #{active? root_path}">Home</a>
      </#{tag_type}>
      <#{tag_type}>
        <a href="#{about_path}" class="#{style} #{active? about_path}">About</a>
      </#{tag_type}>
      <#{tag_type}>
        <a href="#{contact_path}" class="#{style} #{active? contact_path}">Contact</a>
      </#{tag_type}>
      <#{tag_type}>
        <a href="#{blogs_path}" class="#{style} #{active? blogs_path}">Blog</a>
      </#{tag_type}>
      <#{tag_type}>
        <a href="#{portfolio_items_path}" class="#{style} #{active? portfolio_items_path}">Portfolio</a>
      </#{tag_type}>
     NAV
     # This is called a HEREDOC
     nav_links.html_safe
   end

   def active? path
     "active" if current_page? path
   end

end
