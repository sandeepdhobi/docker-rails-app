# Friends List App

## commmand to run to run this project

```
  commands to run : docker-compose build, docker-compose run web yarn install, docker-compose up ==> to run the project ( check also comments of docker-compose.yml )


  795  cd Projects/Practice/docker_rails_app
  796  ls
  797  cd railsfriends
  802  docker-compose build
  803  docker-compose run web bundle install
  804  docker compose up
  805  docker-compose run web bundle install yarn install
  807  docker compose up
  813  docker container ls 
  814  docker container ls -a
  815  docker image prune
  816  docker image ls 
  817  docker compose stop
  818  docker compose down
```

## Helpful command of rails
- `bundle exec rails g scaffold relatives name:string relation:string => rails db:migrate`
- `rails g migration add_user_id_to_relatives user_id:integer:index => rails db:migrate`
- `rails c`
- `user.save`

```Product.all.count
User.last
User.last.one_time_passwords
User.last.one_time_passwords.last
exit
Desertcart::Env['BRAINTREE_MERCHANT_ID'] = ""
exit
Desertcart::Env['BRAINTREE_MERCHANT_ID'] = "32423432432HFSDFHSDHFSDHAFHHFHADSFHDSHAF"
Desertcart::Env['PRIVATE_KEY']  = "ABCPricvateKey"
exit
Desertcart::Env['BRAINTREE_MERCHANT_ID'] = ""
PaypalAccount.last
Checkout.last
PaypalAccount.delete_all
Checkout.find[31]
Checkout.find(31)
PaypalAccount.last
PaypalAccount.find(14)
BrainTree.count
BrainTree.last
PlusMembership.delete_all
Checkout.last
Checkout.last.paypal_account
PaypalAccount.last
BrainTree.last
User.find_by(email: 'sandeep.dhobi@desertcart.ae').update(admin: true)
User.find_by(email: 'sandeep.dhobi@desertcart.ae').update(password: 'Test@1234')
PluaMembership.first
PlusMembership.first
PlusMembership.last.plus_membership_cycles
PlusMembership.last.plus_membership_cycles.last.paypal_account_transactions
PlusMembership.last.plus_membership_cycles.first.paypal_account_transactions
BrainTree.last
Order.find(102).paypal_account_transactions
Desertcart::Env['BRAINTREE_MERCHANT_ID']
Desertcart::Env['BRAINTREE_PRIVATE_KEY']
Desertcart::Env['BRAINTREE_PUBLIC_KEY']
CreditCard.last
CreditCard.update(:active => true, :where => {:id => 23})
CreditCard.update(23, :active => true)
CreditCard.update(23, :active => false)
CreditCard.last
CreditCard.update(24, :active => true)
CreditCard.update(24, :active => false)
Order.find(143)
Order.update(143, :shipping_status => 'card_declined')
Order.update(143, :shipping_status => 'processing')
exit
Product.last
Store.where(category: 'marketplace')
Store.count
Store.all.pluck(:name)
Store.last
st = Store.find 8
st.category = 'marketplace'
st.save
pp = Product.last
pp = pp.becomes(Product)
pp.store_id = 8
pp.save
pp.title = 'ABC'
pp.save
pp.reload
pp.store_id
INTEGRATED_STORE_IDS
pp.save
reload!
pp = Product.last
pp.title = 'aaaaa'
pp.save
pp.store.currency
pp.store.currency_code
pp.store.currency
pp.store.country
pp.store.country_code
st
st.country_code = 'AE'
st.save
pp.save
Desertcart::Env['BRAINTREE_MERCHANT_ID']
exit
Order.last.update_attributes(shipping_status: 'shipped');
ap Product.last
```



## Something of Rails and also Ruby
```
class Blurb
  attr_accessor :content, :time, :mood

  def initialize(mood, content="")
    @time    = Time.now
    @content = content[0..39]
    @mood    = mood
  end

  def moodify
    if    @mood == :sad
      return ":-("
    elsif @mood == :happy
      return ":-)"
    # Add other moods here
    end

    # The default mood
    ":-|"
  end
end

class Blurbalizer
  def initialize(title)
    @title  = title
    @blurbs = []
  end

  def add_a_blurb(mood, content)
    @blurbs << Blurb.new(mood, content)
  end

  def show_timeline
    puts "Blurbalizer: #{@title} has #{@blurbs.count} Blurbs"

    @blurbs.sort_by { |t|
      t.time
    }.reverse.each { |t|
      puts "#{t.content.ljust(40)} #{t.time}"
    }
  end
end

myapp.show_timeline
```

- [ ] class and instance method ( small and capital ) https://betterexplained.com/articles/intermediate-rails-understanding-models-views-and-controllers/
```
 def self.foo
    "Class method"    # User.foo
  end

  def bar
   "instance method"  # user.bar
  end
```

- [ ] Making new model ( entries ). user.reload required to fresh the database and not access stale entires only
```
joe = User.new( :name => "Sad Joe" )        # not saved , joe.save required 
bob = User.create ( :name => "Happy Bob" )  # saved
```

- [ ] Custom Associations
```
belongs_to :primary_status, :model => 'Status', :foreign_key => 'primary_status_id'
belongs_to :secondary_status, :model => 'Status', :foreign_key => 'secondary_status_id'
```

- [ ] Quick controllers
1. Handle things like sessions, logins/authorization, filters, redirection, and errors.
2. Have default methods (added by ActionController). Visiting http://localhost:3000/user/show will attempt to call the “show” action if there is one, or automatically render show.rhtml if the action is not defined.
3. Pass instance variables like @user get passed to the view. Local variables (those without @) don’t get passed.
4. Are hard to debug. Use render :text => "Error found" and return to do printf-style debugging in your page. This is another good reason to put code in models, which are easy to debug from the console.
5. Use sessions to store data between requests: session[:variable] = “data”.




- [ ] Views

1. Controller actions use views with the same name (method show loads show.rhtml by default)

2. Controller instance variables (@foo) are available in all views and partials (wow!)

4. <% ... %>: Run the code, but don’t print anything. Used for if/then/else/end and array.each loops. You can comment out sections of HTML using <% if false %> Hi there <% end %>. You get a free blank line, since you probably have a newline after the closing %>.

5. <%- ... %>: Run the code, and don’t print the trailing newline. Use this when generating XML or JSON when breaking up .rhtml code blocks for your readability, but don’t want newlines in the output.

6. <%= ... %>: Run the code and print the return value, for example: <%= @foo %> (You did remember the @ sign for controller variables passed to the view, right?). Don’t put if statements inside the <%=, you’ll get an error.

7. <%= h ... %>: Print the code and html escape the output: > becomes >. h() is actually a Ruby function, but called without parens, as Rubyists are apt to do.

- [ ] https://betterexplained.com/articles/starting-ruby-on-rails-what-i-wish-i-knew/
