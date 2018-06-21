 require 'rails_helper'
 describe UsersController do

   describe "POST create" do
     context "with valid attributes" do
       it "creates a new student" do
         #expect{
          # post :create, { :user => { :first_name => "Bill", :last_name => "Smith" } }
         #}.to change(User,:count).by(1)
       end

       it "redirects to the new student" do
         #post :create, { :user => { :first_name => "Bill", :last_name => "Smith" } }
         #expect(response).to redirect_to User.last
       end
     end
   end

 end
