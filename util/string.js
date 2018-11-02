'use strict';
var token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImp0aSI6IjhkNzNtbmc4OWVkIn0.eyJpc3MiOiJodHRwOlwvXC9hcGkuZmFzdHJhdmVsLmNvLmlkIiwiYXVkIjoiRmFzdHJhdmVsQjJCIENsaWVudCIsImp0aSI6IjhkNzNtbmc4OWVkIiwiaWF0IjoxNTM2NTgzNzgwLCJuYmYiOjE1MzY1ODM4NDAsImV4cCI6MTUzNjU4NzM4MCwib3V0bGV0SWQiOiJGVDQ2NDg5IiwicGluIjoiMjMwNTA5Iiwia2V5IjoiMDgyMzkyIn0.DkakYRidtXY0bZBl3rG1oewSN19_KbFCeysE9oHquAE";

var base_url = "https://api.fastravel.co.id/flight/";

var RD = {
    success: "Success.",
    failed: "Failed.",
    general_error: "General error.",
    keywords_offset: "Keywords tidak boleh lebih dari 5 produk!",
    not_found: "Produk tidak ditemukan.",
    empty: "Penerbangan tidak tersedia.",
    empty_aiirline: "airline tidak boleh kosong.",
    empty_date: "tanggal penerbangan tidak boleh kosong."
};

exports.response = function(rc,rd){
    var out = {
        rc : rc,
        rd : RD[rd]
    };

    return out;
}

exports.getUrl = function(path){
    return base_url+path;
}

exports.getSearchParam = function(data,airline){
    var params = {
        airline : airline,
        departure : data.departure,
        arrival : data.arrival,
        departureDate : data.departureDate,
        returnDate : data.departureDate,
        isLowestPrice : data.isLowestPrice,
        adult : data.adult,
        child : data.child,
        infant : data.infant,
        token : token
    };

    return params;
}

exports.getSearchParam2 = function(data){
    var params = {
        airline : data.airline,
        departure : data.departure,
        arrival : data.arrival,
        departureDate : data.departureDate,
        returnDate : data.departureDate,
        isLowestPrice : data.isLowestPrice,
        adult : data.adult,
        child : data.child,
        infant : data.infant,
        token : token
    };

    return params;
}

exports.getFareParam = function(data){
    var params = {
        airline : data.airline,
        departure : data.departure,
        arrival : data.arrival,
        departureDate : data.departureDate,
        returnDate : data.departureDate,
        adult : data.adult,
        child : data.child,
        infant : data.infant,
        seats : data.seats,
        token : token
    };

    return params;
}