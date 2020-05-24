class PlansController < ApplicationController
  def index
    @plans = Plan.includes(:user)
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
    end
    
  end

  def show
    
    # require 'unirest'
    @plan = Plan.find(params[:id])
    # skyscannerAPIを叩いて情報を取得(unirest形式)
  #   @response = Unirest.get "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsequotes/v1.0/US/USD/en-US/SFO-sky/JFK-sky/2020-06-01?inboundpartialdate=2020-07-01",
  # headers:{
  #   "X-RapidAPI-Host" => "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
  #   "X-RapidAPI-Key" => "5fbb370a14msh448274ed39c0dfap1ac708jsn3bde6104ef41"
  # }
    require 'uri'
    require 'net/http'
    require 'openssl'

    url = URI("https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsequotes/v1.0/JP/JPY/ja-JP/JP-sky/BKK-sky/2020-06-01?inboundpartialdate=2020-07-01")
    http = Net::HTTP.new(url.host, url.port)
    #出来上がるもの#<Net::HTTP skyscanner-skyscanner-flight-search-v1.p.rapidapi.com:443 open=false>
    http.use_ssl = true
    # httpでSSL/TLS(サーバ間の通信の暗号化)を使うかどうかを設定する。デフォルトはfalseのため
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    # 検証モードを返す。デフォルトはnil 後半はこの場合、クライアントモードで使用するため、サーバから受け取った証明書が検証されるが、失敗してもハンドシェイク(装置間の応答確認や設定の交換)は継続される

    # uriを利用してリクエストして変数に代入
    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'skyscanner-skyscanner-flight-search-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = '5fbb370a14msh448274ed39c0dfap1ac708jsn3bde6104ef41'

    # リクエストの送信
    # response = http.request(request)
    # @response = JSON.parse(response.body)

    # EazyTranslateというgemを使った翻訳は、APIが現在ないのかAPIkeyが取得できないため実装できず。
    # @response = EasyTranslate.translate('response.body', :to => 'ja')

    #航空会社をjsonで取得するリクエストをだすパターン(翻訳の方法がわかっていないため現在非表示)
    # uri = URI.parse("https://script.google.com/macros/s/AKfycbzppG62ciGaO43_fNOWT-Z_FPGuUzcotc_9bZCtrxIhlmxeGvDV/exec?text=#{@response["Carriers"][0]["Name"]}&source=en&target=ja")
    # uri = URI("https://script.google.com/macros/s/AKfycbzppG62ciGaO43_fNOWT-Z_FPGuUzcotc_9bZCtrxIhlmxeGvDV/exec?text=hello&source=en&target=ja")
    # json = Net::HTTP::Get.new(uri)
    # json_response = http.request(json)
    # @translate_airline = JSON.parse(json_response.body)
    

  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    plan = Plan.find(params[:id])
    if plan.user_id == current_user.id
      plan.update(post_params)
      redirect_to '/'
    end
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy if plan.user_id == current_user.id
  end
  
  private

  def plan_params
    params.require(:plan).permit(:title, :details, :image, :region, :date).merge(user_id: current_user.id)
  end
end

# require 'unirest'

# response = Unirest.get "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsequotes/v1.0/US/USD/en-US/SFO-sky/JFK-sky/2020-06-01?inboundpartialdate=2020-07-01",
#   headers:{
#     "X-RapidAPI-Host" => "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
#     "X-RapidAPI-Key" => "5fbb370a14msh448274ed39c0dfap1ac708jsn3bde6104ef41"
#   }

# require 'uri'
# require 'net/http'
# require 'openssl'

# url = URI("https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsequotes/v1.0/US/USD/en-US/SFO-sky/JFK-sky/2020-06-01?inboundpartialdate=2020-07-01")

# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# request = Net::HTTP::Get.new(url)
# request["x-rapidapi-host"] = 'skyscanner-skyscanner-flight-search-v1.p.rapidapi.com'
# request["x-rapidapi-key"] = '5fbb370a14msh448274ed39c0dfap1ac708jsn3bde6104ef41'

# response = http.request(request)
# puts response.read_body
