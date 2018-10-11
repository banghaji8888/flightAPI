'use strict';
var helper = require('../util/helper');

exports.fare = function(req,res){
    try{
        logger.info("Fare....");

       let params = string.getFareParam(req.body);
       let url = string.getUrl("fare");
       curl.post(url,params,function(response){
            res.send(response);
       });
    }catch(e){
        logger.error(e);
        res.json(string.response("99","general_error"));
    }
}

exports.search = function(req,res){
    try{
        logger.info("Search....");
        var maskapai = ["TPJT","TPGA","TPQG","TPSJ"];
        var promiseMaskapai = [];
        
        for(let i in maskapai){
            let url = string.getUrl("search");
            let params = string.getSearchParam(req.body,maskapai[i]);
            let awaitRes = helper.seacrh_promise(url,"POST",params);
            promiseMaskapai.push(awaitRes);
        }

        Promise.all(promiseMaskapai)
            .then(values => {
                var response = [];
                for(let val of values){
                    if(val == "undefined" || val == null || val == "") continue;

                    var flights = JSON.parse(val);
                    for(let flight of flights['data']){
                        response.push(flight);
                    }
                }

                res.json(response);
            })
            .catch(e => {
                logger.error(e);
            });
    }catch(e){
        logger.error(e);
        res.json(string.response("99","general_error"));
    }
}