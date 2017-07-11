require "rails_helper"

RSpec.describe RentalHistoriesController, type: :routing do
  describe "routing" do

    context "for user" do
      it "routes to #index" do
        expect(:get => "/books/1/rental_histories").to route_to("rental_histories#index", book_id: '1')
      end

      it "routes to #new" do
        expect(:get => "/books/1/rental_histories/new").to route_to("rental_histories#new", book_id: '1')
      end

      it "routes to #show" do
        expect(:get => "/rental_histories/1").to route_to("rental_histories#show", id: "1")
      end

      it "routes to #edit" do
        expect(:get => "/rental_histories/1/edit").to route_to("rental_histories#edit", id: "1")
      end

      it "routes to #create" do
        expect(:post => "/books/1/rental_histories").to route_to("rental_histories#create", book_id: '1')
      end

      it "routes to #update via PUT" do
        expect(:put => "/rental_histories/1").to route_to("rental_histories#update", id: "1")
      end

      it "routes to #update via PATCH" do
        expect(:patch => "/rental_histories/1").to route_to("rental_histories#update", id: "1")
      end

      it "routes to #destroy" do
        expect(:delete => "/rental_histories/1").to route_to("rental_histories#destroy", id: "1")
      end
    end

    context "for admin" do
      it "routes to #index" do
        expect(:get => "/admin/rental_histories").to route_to("rental_histories#index")
      end

      it "routes to #new" do
        expect(:get => "/admin/rental_histories/new").to route_to("rental_histories#new")
      end

      it "routes to #show" do
        expect(:get => "/admin/rental_histories/1").to route_to("rental_histories#show", id: "1")
      end

      it "routes to #edit" do
        expect(:get => "/admin/rental_histories/1/edit").to route_to("rental_histories#edit", id: "1")
      end

      it "routes to #create" do
        expect(:post => "/admin/rental_histories").to route_to("rental_histories#create")
      end

      it "routes to #update via PUT" do
        expect(:put => "/admin/rental_histories/1").to route_to("rental_histories#update", id: "1")
      end

      it "routes to #update via PATCH" do
        expect(:patch => "/admin/rental_histories/1").to route_to("rental_histories#update", id: "1")
      end

      it "routes to #destroy" do
        expect(:delete => "/admin/rental_histories/1").to route_to("rental_histories#destroy", id: "1")
      end
    end
  end
end
