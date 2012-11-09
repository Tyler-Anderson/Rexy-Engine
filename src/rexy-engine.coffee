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

class Rexy
    constructor: (url, db) ->
        @url = url + "/graphs/"
        @db = db

    #---GET Operations---
    getGraphs : (cb) ->
        rest.get(@url)
            .on "complete", (data) ->
                cb data
        true

    getNamedGraph : (cb) ->
        rest.get(@url + @db)
            .on "complete", (data) ->
                cb data
        true

    getVertices : (cb) ->
        rest.get(@url + @db + "/vertices")
            .on "complete", (data) ->
                cb data
        true

    getVertexWithId: (cb, id) ->
        rest.get(@url + @db + "/vertices/" + id)
            .on "complete", (data) ->
                cb data
        true

    getAdjacentOut: (cb, req, _buf = "") ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
        rest.get(@url + @db + "/vertices/" + req.id + "/out" + _buf)
            .on "complete", (data) ->
                cb data
        true

    getAdjacentIn: (cb, req, _buf = "") ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
        rest.get(@url + @db + "/vertices/" + req.id + "/in" + _buf)
            .on "complete", (data) ->
                cb data
        true

    getAdjacentBoth: (cb, req, _buf = "") ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
        rest.get(@url + @db + "/vertices/" + req.id + "/both" + _buf)
            .on "complete", (data) ->
                cb data
        true

    getOutVerticesCount : (cb, req, _buf = "") ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
        rest.get(@url + @db + "/vertices/" + req.id + "/outCount" + _buf)
            .on "complete", (data) ->
                cb data
        true

    getInVerticesCount : (cb, req, _buf = "") ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
        rest.get(@url + @db + "/vertices/" + req.id + "/inCount" + _buf)
            .on "complete", (data) ->
                cb data
        true

    getBothVerticesCount : (cb, req, _buf = "") ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
        rest.get(@url + @db + "/vertices/" + req.id + "/bothCount" + _buf)
            .on "complete", (data) ->
                cb data
        true

    getOutVertices : (cb, req, _buf = "") ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
        rest.get(@url + @db + "/vertices/" + req.id + "/outIds" + _buf)
            .on "complete", (data) ->
                cb data
        true

    getInVertices : (cb, req, _buf = "") ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
        rest.get(@url + @db + "/vertices/" + req.id + "/inIds" + _buf)
            .on "complete", (data) ->
                cb data
        true

    getByBothVertices : (cb, req, _buf="") ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
        rest.get(@url + @db + "/vertices/" + req.id + "/bothIds" + _buf)
            .on "complete", (data) ->
                cb data
        true

    getAdjacentByEdgeLabel : (cb, req) ->
        rest.get(@url + @db + "/vertices/" + req.id + req.dir + "?_" + req.label + "=written_by")
            .on "complete", (data) ->
                cb data
        true

    getEdges : (cb) ->
        rest.get(@url + @db + "/edges")
            .on "complete", (data) ->
                cb data
        true

    getEdgeById : (cb, id) ->
        rest.get(@url + @db + "/edges" + id)
            .on "complete", (data) ->
                cb data
        true

    getVertexOutEdges : (cb, req, _buf = "") ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
        rest.get(@url + @db + "/edges" + "/vertices/" + req.id + "/outE" + _buf)
            .on "complete", (data) ->
                cb data
        true

    getVertexInEdges : (cb, req, _buf = "") ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
        rest.get(@url + @db + "/edges" + "/vertices/" + req.id + "/inE" + _buf)
            .on "complete", (data) ->
                cb data
        true

    getVertexBothEdges : (cb, req, _buf = "") ->
        if req.params
            _buf += "?"
            for k,v of req.params
                _buf +=  k + "=" + v + "&"
            _buf = _buf.slice 0, -1
         rest.get(@url + @db + "/edges" + "/vertices/" + req.id + "/bothE" + _buf)
            .on "complete", (data) ->
                cb data
        true

    getByEdgeLabel : (cb, req) ->
        rest.get(@url + @db + "/vertices/" + req.id + req.dir + "E?_" + req.label + "=written_by")
            .on "complete", (data) ->
                cb data
        true

    getIndices : (cb) ->
        rest.get(@url + @db + "/indices")
            .on "complete", (data) ->
                cb data
        true

    getElementsByKV : (cb, req) ->
        rest.get(@url + @db + "/indices/index?key=" + req.key + "&value=" + req.value)
            .on "complete", (data) ->
                cb data
        true

    getElementCountByKV : (cb, req) ->
        rest.get(@url + @db + "/indices/index/count?key=" + req.key + "&value=" + req.value)
            .on "complete", (data) ->
                cb data
        true

    getKeyIndices : (cb) ->
        rest.get(@url + @db + "/keyindices/")
            .on "complete", (data) ->
                cb data
        true

    getVertexKeys : (cb) ->
        rest.get(@url + @db + "/keyindices/vertex")
            .on "complete", (data) ->
                cb data
        true

    getEdgeKeys : (cb) ->
        rest.get(@url + @db + "/keyindices/edge")
            .on "complete", (data) ->
                cb data
        true

            
    #---POST Operations---

    postVertex : (cb) ->
        rest.post(@url + @db + "/vertices/")
            .on "complete", (data) ->
                cb data
            #.on "error", (error) ->
            #    console.log error
        true

    postVertexWithId : (cb, id) ->
        rest.post(@url + @db + "/vertices/" + id)
            .on "complete", (data)->
                cb data
        true
            
    #postCreateOrUpdateV takes a properties object for k/v pairs
    postCreateOrUpdateV : (cb, req, _buf = "") ->
        for k,v of req.properties
            _buf +=  k + "=" + v + "&"
        _buf = _buf.slice 0, -1
        rest.post(@url + @db + "/vertices/" + req.id + "?" + _buf)
            .on "complete", (data)->
                cb data
        true

    postEdgeWithLabel : (cb, req, _buf = "") ->
        for k, v of req.properties
            _buf += "&" + k + "=" + v
        rest.post(@url + @db + "/edges?_outV=" + req.outV + "&_label=" + req.label + "&_inV=" + req.inV + _buf)
            .on "complete", (data) ->
                cb data

    #sig id, outV, label, inV
    postEdgeWithId : (cb, req, _buf = "") ->
        for k,v of req.properties
            _buf += "&" + k + "=" + v
        rest.post(@url + @db + "/edges/" + req.id + "?_outV=" + req.outV + "&_label=" + req.label + "&_inV=" + req.inV + _buf)
            .on "complete", (data)->
                cb data
        true

    #properties are k/v pairs of key mappings, as in key=key for the rest, may work with other mappings idk
    postUpdateEdge : (cb, req, _buf = "") ->
        for k,v of req.properties
            _buf += k + "=" + v + "&"
        _buf = _buf.slice 0, -1
        rest.post(@url + @db + "/edges/" + req.id + "?" + _buf)
            .on "complete", (data) ->
                cb data
        true

    postManualIndex : (cb, index) ->
        rest.post(@url + @db + "/indices/" + index + "?class=vertex")
            .on "complete", (data) ->
                cb data
        true

    postCreateKey : (cb, req) ->
        rest.post(@url + @db + "/keyindices/" + req.vertex + "/" + req.key)
            .on "complete", (data) ->
                cb data
        true


    #---PUT Operations---
    
    putReplaceVProperties : (cb, req, buf ="") ->
        for k,v of req.properties
            _buf += k + "=" + v + "&"
        _buf = _buf.slice 0, -1
        rest.put(@url + @db + "/vertices/" + req.id + "?" + _buf)
            .on "complete", (data) ->
                cb data
        true

    putReplaceEProperties : (cb, req, _buf = "") ->
        for k,v of req.properties
            _buf += k + "=" + v + "&"
        _buf = _buf.slice 0, -1
        rest.put(@url + @db + "/edges/" + req.id + "?" + _buf)
            .on "complete", (data) ->
                cb data
        true
    
    putVertexAtIndexByKV : (cb, req) ->
        rest.put(@url + @db + "/indices/" + req.index + "?key=" + req.key + "&value=" + req.value + "&id=" + req.id)
            .on "complete", (data) ->
                cb data
        true


    #---DELETE Operations---

    delVertex : (cb, id) ->
        rest.del(@url + @db + "/vertices/" + id)
            .on "complete", (data) ->
                cb data
        true
    
    #properties is an array keys
    delVProps : (cb, req) ->
        rest.del(@url + @db + "/edges/" + req.id + req.properties.join "&")
            .on "complete", (data) ->
                cb data
        true

    delIndex : (cb, index) ->
        rest.del(@url + @db + "/indices/" + index)
            .on "complete", (data) ->
                cb data
        true

    delVertexAtIndexByKV : (cb, req) ->
        rest.del(@url + @db + "/indices/" + req.index + "?key=" + req.key + "&value=" + req.value + "&class=vertex&id=" + req.id)
            .on "complete", (data) ->
                cb data
        true

    #---Batch Kibble extension---
    
    #takes array of id's
    getBatchV : (cb, idList, _buf = "") ->
        _buf += "["
        for i in [0...idList.length]
            _buf += idList[i] += ","
        _buf = _buf.slice 0, -1
        _buf += "]"
        rest.get(@url + @db + "/tp/batch/vertices?idList=" + _buf)
            .on "complete", (data) ->
                cb data
        true

    getBatchE : (cb, req, _buf = "") ->
        _buf += "["
        for i in [0...idList.length]
            _buf += idList[i] += ","
        _buf = _buf.slice 0, -1
        _buf += "]"
        rest.get(@url + @db + "/tp/batch/edges?idList=" + _buf)
            .on "complete", (data) ->
                cb data
        true

    postBatch : (cb, txList) ->
        rest.postJson(@url + @db + "/tp/batch/tx", txList)
            .on "complete", (data) ->
                cb data
        true
        
    
    #---Gremlin extension---

    gremlin : (cb, req) ->
        rest.postJson(@url + @db + "/tp/gremlin", req)
            .on "complete", (data) ->
                cb data
        true

    gremlinV : (cb, id, req) ->
        rest.postJson(@url + @db + "/vertices/" + id + "/tp/gremlin", req)
            .on "complete", (data) ->
                cb data
        true

    gremlinE : (cb, id, req) ->
        rest.postJson(@url + @db + "/edges/" + id + "/tp/gremlin", req)
            .on "complete", (data) ->
                cb data
        true

    #---Frames extension---
    

    frameV : (cb, id, frame) ->
        rest.get(@url + @db + "/vertices/" + id + "/tp/frames/" + frame)
            .on "complete", (data) ->
                cb data
        true

    frameE : (cb, id, frame) ->
        rest.get(@url + @db + "/edges/" + id + "/tp/frames/" + frame)
            .on "complete", (data) ->
                cb data
        true

    frameEI : (cb, id, frame) ->
        rest.get(@url + @db + "/edges/" + id + "/tp/frames/" + frame + "direction=inverse")
            .on "complete", (data) ->
                cb data
        true


module.exports = Rexy
