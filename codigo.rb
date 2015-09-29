 
<ul class="users">
  <% @users.each do |user| %>
    <li>
        <!-- Call /views/users/_user.html.erb.
        Rails infers that @users is a list of User objects and automatically
        iterates through them  -->
        <%= render @users %>
    </li>
  <% end %>
</ul>


<% if current_user.admin? && !current_user?(user) %>
        |  <%= link_to "Delete", user, method: :delete, data: { confirm:  "You sure?"} %>
  <% end %>