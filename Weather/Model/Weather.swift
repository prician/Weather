//
//  Weather.swift
//  Weather
//
//  Created by WSH on 2021/11/5.
//
import HandyJSON

struct WeatherData: HandyJSON {
    let coord = Coord()
    let weather = [Weather]()
    let base = ""
    var main = Main()
    let visibility = ""
    let wind = Wind()
    let cloud = Clouds()
    let dt = ""
    let sys = Sys()
    let timezone = ""
    let id = ""
    let name = ""
    let cod = ""
    
}
struct Coord: HandyJSON {
    let lon = ""
    let lat = ""
}

struct Weather: HandyJSON {
    let id = ""
    let main = ""
    let description = ""
    let icon = ""
}

struct Main: HandyJSON {
    var temp = 0
    let feels_like = 0
    let temp_min = 0
    let temp_max = 0
    let pressure = ""
    let humidity = ""
    let sea_leavel = ""
    let grnd_level = ""
}

struct Wind: HandyJSON {
    let speed = ""
    let deg = ""
    let gust = ""
}

struct Clouds: HandyJSON {
    let all = ""
}

struct Sys: HandyJSON {
    let country = ""
    let sunrise = ""
    let sunset = ""
}
