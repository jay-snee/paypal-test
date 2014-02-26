class TestObject


  def make_paypal_explode
    data = JSON.parse '{"intent":"sale","payer":{"payment_method":"credit_card","funding_instruments":[{"credit_card":{"number":"4012888888881881","type":"visa","expire_month":1,"expire_year":2017,"first_name":"Phil","last_name":"McExample","billing_address":{"line1":"234 Somewhere","city":"Somewhere","country_code":"GB","postal_code":"Somewhere","state":"Somewhere"}}}]},"transactions":[{"amount":{"currency":"GBP","total":"20.00"},"description":"phil@example.com","item_list":{"items":[{"quantity":"1","name":"Better","price":"20.00","currency":"GBP","sku":"4"}]}}]}'
    payment = PaypalPayment.new data
    begin
      payment.create
    rescue
      puts "Boom!"
      payment.create
    end
  end

end