module Transferit
  module V1
    module Entities
      class Cities < Grape::Entity
        expose :title
        expose :id
      end

      class Pages < Grape::Entity
        expose :total_count
      end
    end

    class Cities < Grape::API
      format :json

      resource :cities do

        desc 'Get cities for user'
        params do
          requires :title, type: String, desc: 'City title'
          optional :page, type: Integer, default: 1, desc: 'Current page'
          optional :per, type: Integer, default: 10, desc: 'Quantity elements on page'
        end
        post do
          title = params[:title].strip.mb_chars.capitalize.to_s

          cities = City.where("title LIKE ?", "%#{title}%").order(title: :asc)

          cities = cities.page(params[:page]).per(params[:per])
          pages = [{total_count: cities.total_count}]

          present cities, with: Transferit::V1::Entities::Cities, root: 'сities'
          present pages, with: Transferit::V1::Entities::Pages, root: 'pages'
        end

        desc 'Get city_id'
        params do
          requires :title, type: String, desc: 'City title'
        end
        get do
          title = params[:title].strip.mb_chars.capitalize.to_s

          city = City.find_by("title LIKE ?", "%#{title}%")

          {city_id: city.try(:id)}
        end

        desc 'Get city title by city_id'
        params do
          requires :city_id, type: Integer, desc: 'City'
        end
        get 'title' do
          city = City.find_by_id(params[:city_id])

          {title: city.try(:title)}
        end

      end

    end
  end
end