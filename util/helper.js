'use strict';

function prety_price(price){
    var out = new Intl.NumberFormat('en-IN', { style: 'currency', currency: 'IDR' }).format(price);
    out = out.replace("IDR","Rp ");
    out = out.replace(/\,/g,".");

    return out;
}

exports.seacrh_promise = function(url,method,params){
    try{
        var Promise = require("bluebird");
        return new Promise((resolve, reject) => {
            try{
                const options = {  
                    url: url,
                    method: method,
                    headers: {
                        'Accept': 'application/json'
                    },
                    body: params,
                    json: true
                };

                logger.info("PARAMS: "+JSON.stringify(options));
                request(options, function(err, res, body) { 
                    var resp = JSON.stringify(body);
                    logger.info("RESPONSE ["+url+"]: "+resp);
                    resolve(resp);
                });
            }catch(e){
                logger.error(e);
                reject(e);
            }
        });
    }catch(e){
        logger.error(e);
    }
}