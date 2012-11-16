###----------------------------------

  Rexster API for nodejs
  
  requirements:
    restler

  Author: Tyler Anderson
  github: Tyler-Anderson
  email: tyler@brava.do
  twitter: _Bravado
  website: http://brava.do

----------------------------------###

rest = require 'restler'

class Rexy_Engine
    constructor: (url, db) ->
        @url = url + "/graphs/"
        @db = db

    #---GET Operations---
    getGraphs : (ctx, cb) ->
        rest.get(@url)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getNamedGraph : (ctx, cb) ->
        rest.get(@url + @db)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getVertices : (ctx, cb) ->
        rest.get(@url + @db + "/vertices")
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getVertexWithId: (ctx, cb, id) ->
        rest.get(@url + @db + "/vertices/" + id)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getAdjacentOut: (ctx, cb, req) ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
        rest.get(@url + @db + "/vertices/" + req._id + "/out" + _buf)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getAdjacentIn: (ctx, cb, req) ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
        rest.get(@url + @db + "/vertices/" + req._id + "/in" + _buf)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getAdjacentBoth: (ctx, cb, req) ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
        rest.get(@url + @db + "/vertices/" + req._id + "/both" + _buf)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getOutVerticesCount : (ctx, cb, req) ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
        rest.get(@url + @db + "/vertices/" + req._id + "/outCount" + _buf)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getInVerticesCount : (ctx, cb, req) ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
        rest.get(@url + @db + "/vertices/" + req._id + "/inCount" + _buf)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getBothVerticesCount : (ctx, cb, req) ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
        rest.get(@url + @db + "/vertices/" + req._id + "/bothCount" + _buf)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getOutVertices : (ctx, cb, req) ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
        rest.get(@url + @db + "/vertices/" + req._id + "/outIds" + _buf)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getInVertices : (ctx, cb, req) ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
        rest.get(@url + @db + "/vertices/" + req._id + "/inIds" + _buf)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getByBothVertices : (ctx, cb, req) ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
        rest.get(@url + @db + "/vertices/" + req._id + "/bothIds" + _buf)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getAdjacentByEdgeLabel : (ctx, cb, req) ->
        rest.get(@url + @db + "/vertices/" + req._id + req.dir + "?_" + req.label + "=written_by")
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getEdges : (ctx, cb) ->
        rest.get(@url + @db + "/edges")
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getEdgeById : (ctx, cb, id) ->
        rest.get(@url + @db + "/edges" + id)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getVertexOutEdges : (ctx, cb, req) ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
        rest.get(@url + @db + "/edges" + "/vertices/" + req._id + "/outE" + _buf)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getVertexInEdges : (ctx, cb, req) ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
        rest.get(@url + @db + "/edges" + "/vertices/" + req._id + "/inE" + _buf)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getVertexBothEdges : (ctx, cb, req) ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
         rest.get(@url + @db + "/edges" + "/vertices/" + req._id + "/bothE" + _buf)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getByEdgeLabel : (ctx, cb, req) ->
        rest.get(@url + @db + "/vertices/" + req._id + req.dir + "E?_" + req.label + "=written_by")
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getIndices : (ctx, cb) ->
        rest.get(@url + @db + "/indices")
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getElementsByKV : (ctx, cb, req) ->
        rest.get(@url + @db + "/indices/index?key=" + req.key + "&value=" + req.value)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getElementCountByKV : (ctx, cb, req) ->
        rest.get(@url + @db + "/indices/index/count?key=" + req.key + "&value=" + req.value)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getKeyIndices : (ctx, cb) ->
        rest.get(@url + @db + "/keyindices/")
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getVertexKeys : (ctx, cb) ->
        rest.get(@url + @db + "/keyindices/vertex")
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getEdgeKeys : (ctx, cb) ->
        rest.get(@url + @db + "/keyindices/edge")
            .on "complete", (data) ->
                cb.call ctx, data
        true

            
    #---POST Operations---

    postVertex : (ctx, cb) ->
        rest.post(@url + @db + "/vertices/")
            .on "complete", (data) ->
                cb.call ctx, data
            #.on "error", (error) ->
            #    console.log error
        true

    postVertexWithId : (ctx, cb, id) ->
        rest.post(@url + @db + "/vertices/" + id)
            .on "complete", (data)->
                cb.call ctx, data
        true
            
    #postCreateOrUpdateV takes a properties object for k/v pairs
    postCreateOrUpdateV : (ctx, cb, req) ->
        for k,v of req.properties
            _buf +=  k + "=" + v + "&"
        _buf = _buf.slice 0, -1
        rest.post(@url + @db + "/vertices/" + req._id + "?" + _buf)
            .on "complete", (data)->
                cb.call ctx, data
        true

    postEdgeWithLabel : (ctx, cb, req) ->
        for k, v of req.properties
            _buf += "&" + k + "=" + v
        rest.post(@url + @db + "/edges?_outV=" + req.outV + "&_label=" + req.label + "&_inV=" + req.inV + _buf)
            .on "complete", (data) ->
                cb.call ctx, data

    #sig id, outV, label, inV
    postEdgeWithId : (ctx, cb, req) ->
        for k,v of req.properties
            _buf += "&" + k + "=" + v
        rest.post(@url + @db + "/edges/" + req._id + "?_outV=" + req.outV + "&_label=" + req.label + "&_inV=" + req.inV + _buf)
            .on "complete", (data)->
                cb.call ctx, data
        true

    #properties are k/v pairs of key mappings, as in key=key for the rest, may work with other mappings idk
    postUpdateEdge : (ctx, cb, req) ->
        for k,v of req.properties
            _buf += k + "=" + v + "&"
        _buf = _buf.slice 0, -1
        rest.post(@url + @db + "/edges/" + req._id + "?" + _buf)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    postManualIndex : (ctx, cb, index) ->
        rest.post(@url + @db + "/indices/" + index + "?class=vertex")
            .on "complete", (data) ->
                cb.call ctx, data
        true

    postCreateKey : (ctx, cb, req) ->
        rest.post(@url + @db + "/keyindices/" + req.vertex + "/" + req.key)
            .on "complete", (data) ->
                cb.call ctx, data
        true


    #---PUT Operations---
    
    putReplaceVProperties : (ctx, cb, req, buf ="") ->
        for k,v of req.properties
            _buf += k + "=" + v + "&"
        _buf = _buf.slice 0, -1
        rest.put(@url + @db + "/vertices/" + req._id + "?" + _buf)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    putReplaceEProperties : (ctx, cb, req) ->
        for k,v of req.properties
            _buf += k + "=" + v + "&"
        _buf = _buf.slice 0, -1
        rest.put(@url + @db + "/edges/" + req._id + "?" + _buf)
            .on "complete", (data) ->
                cb.call ctx, data
        true
    
    putVertexAtIndexByKV : (ctx, cb, req) ->
        rest.put(@url + @db + "/indices/" + req.index + "?key=" + req.key + "&value=" + req.value + "&id=" + req._id)
            .on "complete", (data) ->
                cb.call ctx, data
        true


    #---DELETE Operations---

    delVertex : (ctx, cb, id) ->
        rest.del(@url + @db + "/vertices/" + id)
            .on "complete", (data) ->
                cb.call ctx, data
        true
    
    #properties is an array keys
    delVProps : (ctx, cb, req) ->
        rest.del(@url + @db + "/edges/" + req._id + req.properties.join "&")
            .on "complete", (data) ->
                cb.call ctx, data
        true

    delIndex : (ctx, cb, index) ->
        rest.del(@url + @db + "/indices/" + index)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    delVertexAtIndexByKV : (ctx, cb, req) ->
        rest.del(@url + @db + "/indices/" + req.index + "?key=" + req.key + "&value=" + req.value + "&class=vertex&id=" + req._id)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    #---Batch Kibble extension---
    
    #takes array of id's
    getBatchV : (ctx, cb, idList) ->
        _buf = "["
        for i in [0...idList.length]
            _buf += idList[i] += ","
        _buf = _buf.slice 0, -1
        _buf += "]"
        rest.get(@url + @db + "/tp/batch/vertices?idList=" + _buf)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    getBatchE : (ctx, cb, req) ->
        _buf = "["
        for i in [0...idList.length]
            _buf += idList[i] += ","
        _buf = _buf.slice 0, -1
        _buf += "]"
        rest.get(@url + @db + "/tp/batch/edges?idList=" + _buf)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    postBatch : (ctx, cb, txList) ->
        rest.postJson(@url + @db + "/tp/batch/tx", txList)
            .on "complete", (data) ->
                cb.call ctx, data
        true
        
    
    #---Gremlin extension---

    gremlin : (ctx, cb, req) ->
        rest.postJson(@url + @db + "/tp/gremlin", req)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    gremlinV : (ctx, cb, id, req) ->
        rest.postJson(@url + @db + "/vertices/" + id + "/tp/gremlin", req)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    gremlinE : (ctx, cb, id, req) ->
        rest.postJson(@url + @db + "/edges/" + id + "/tp/gremlin", req)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    #---Frames extension---
    

    frameV : (ctx, cb, id, frame) ->
        rest.get(@url + @db + "/vertices/" + id + "/tp/frames/" + frame)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    frameE : (ctx, cb, id, frame) ->
        rest.get(@url + @db + "/edges/" + id + "/tp/frames/" + frame)
            .on "complete", (data) ->
                cb.call ctx, data
        true

    frameEI : (ctx, cb, id, frame) ->
        rest.get(@url + @db + "/edges/" + id + "/tp/frames/" + frame + "direction=inverse")
            .on "complete", (data) ->
                cb.call ctx, data
        true


module.exports = Rexy_Engine
