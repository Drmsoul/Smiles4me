<% if current_user %>
  <h3>Hola <%= current_user.username %></h3>
<% else %>
  <h1>Bienvenido a Smiles4Us</h1>
  <h3>Iniciar Sesion</h3>
  <%= render 'user_sessions/form' %>
<% end %>