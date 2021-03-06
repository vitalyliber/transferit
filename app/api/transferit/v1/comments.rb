module Transferit
  module V1
    module Entities
      class Comments < Grape::Entity
        expose :description
        expose :target_id
        expose :author_id
        expose :star
      end

      class Pages < Grape::Entity
        expose :total_count
      end
    end

    class Comments < Grape::API
      format :json

      resource :comments do

        desc 'Get comments for user'
        params do
          requires :target_id, type: Integer, desc: 'Comments for users'
          optional :page, type: Integer, default: 1, desc: 'Current page'
          optional :per, type: Integer, default: 10, desc: 'Quantity elements on page'
        end
        get do
          comments = Comment.where(target_id: params[:target_id])

          comments = comments.page(params[:page]).per(params[:per])

          pages = [{total_count: comments.total_count}]

          present comments, with: Transferit::V1::Entities::Comments, root: 'comments'
          present pages, with: Transferit::V1::Entities::Pages, root: 'pages'
        end

        desc 'Create comment for user'
        params do
          requires :target_id, type: Integer, desc: 'Comment target'
          requires :author_id, type: Integer, desc: 'Comment author'
          requires :description, type: String, desc: 'Description from author'
          requires :star, type: Integer, values: (1..5).to_a, desc: '1 .. 5'
        end
        post 'create_comment' do
          comment = Comment.new(
                     target_id: params[:target_id],
                     author_id: params[:author_id],
                     description: params[:description],
                     star: params[:star]
          )

          error!('Invalid Comment', 400) unless comment.valid?

          comment.save

          if comment.try(:target).try(:comments).present?
            all_user_stars = comment.target.comments.map {|comment| comment.star}
            average_user_stars = all_user_stars.reduce(:+).to_f / all_user_stars.size
            comment.target.update(star:  average_user_stars.round)
          end

          {comment_id: comment.id}
        end

      end

    end
  end
end