import requests
from flask import Flask, request, jsonify, render_template

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/weather')
def weather():
    api_key = '565097e7c8ce9bb7a72a3c12e815fec2'
    city = request.args.get('city')
    url = f'http://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}&units=metric'
    response = requests.get(url)
    print(response.content)
    weather_data = response.json()
    return render_template('index.html', weather=weather_data)



if __name__ == '__main__':
    app.run(debug=True)
