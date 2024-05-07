document.addEventListener('DOMContentLoaded', function () {
    const getWeatherButton = document.getElementById('getWeatherButton');

    getWeatherButton.addEventListener('click', function () {
        fetchWeather();
    });
});

function fetchWeather() {
	const location = document.getElementById('locationInput').value;
	fetch(`/weather?city=${location}`)
	.then(response => response.json())
	.then(data => {
		const weatherInfo = document.getElementById('weatherInfo')
		            weatherInfo.innerHTML = `<p><strong>Location:</strong> ${data.location}</p>
			    			     <p><strong>Temperature:</strong> ${data.temperature}°C</p>
						     <p><strong>Weather:</strong> ${data.weather}</p>`;
        })
	.catch(error => console.error('Error fetching weather data:', error));

	return false
}
