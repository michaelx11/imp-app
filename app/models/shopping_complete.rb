class ShoppingComplete
    include MongoMapper::Document

    key :date, Date
    key :cost, Float
    key :shopping_run, String # ShoppingRun.id
end
