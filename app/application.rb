# frozen_string_literal: true

# {Application}
class Application < ::Roda
  plugin :all_verbs
  plugin :common_logger, Container[:logger]
  plugin :json_parser
  plugin :json

  route do |r|
    r.get "health" do
      "OK"
    end

    r.on "keys" do
      r.head :key do |key|
        exists = CheckOne.new.call(key: key) ? 200 : 404
        response.status = exists
        nil
      end

      r.get :key do |key|
        GetOne.new.call(key: key)
      end

      r.delete :key do |key|
        DeleteOne.new.call(key: key)
      end

      r.is do
        r.get do
          GetAll.new.call
        end

        r.put do
          CreateOne.new.call(params: r.params)
        end

        r.delete do
          DeleteAll.new.call
        end
      end
    end
  end
end
