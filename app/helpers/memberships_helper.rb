module MembershipsHelper
  def memberships_grid(memberships)
    grid(memberships, html: {class: 'striped'}) do |g|
      g.row_attributes do |m|
        {class: 'clickable-row', data: {href: url_for(m)}}
      end

      g.column name: 'Name', attribute: 'name', assoc: :member
      g.column name: 'Surname', attribute: 'surname', assoc: :member
      g.column name: 'Roles', html: {class: 'hide-on-small-only'} do |m|
        pretty_print_roles(m.roles)
      end
      g.column name: 'Period', attribute: 'id', assoc: :period, custom_filter: Period.order(end: :desc).all.map { |period| [period.summary, period.id]} do |m|
        m.period.summary
      end
      g.column name: 'Fee paid?', attribute: 'fee_paid' do |m|
        m.fee_paid? ? 'Yes' : 'No'
      end
      g.column name: 'Registrar', attribute: 'email', assoc: :registrar, ordering: false, html: {class: 'hide-on-small-only'}
      g.column do |m|
        link_to m, class: 'btn waves-effect waves-light hide-on-small-only' do
          content_tag(:i, 'pageview', class: 'material-icons') 
        end
      end
      g.column do |m|
        link_to edit_membership_path(m), class: 'btn waves-effect waves-light' do
          content_tag(:i, 'edit', class: 'material-icons')
        end
      end
      g.column do |m|
        link_to m, method: :delete, data: {confirm: 'Are you sure?'}, class: 'btn waves-effect waves-light hide-on-small-only' do
          content_tag(:i, 'delete_forever', class: 'material-icons')
        end
      end
    end
  end
end
