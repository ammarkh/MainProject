(function (window ,Codepros) {

    var myMap = Codepros.CreateNew(document.getElementById("map-container"), {
        center: new google.maps.LatLng(33.51849923765608, 36.287841796875),
        zoom: 13,
        geocoder: true,
        styles: [{
            featureType: 'poi',
            elementtype: 'labels',
            stylers: [
			{ visibility: 'off' }
            ]
        }]
    });
    
    var p = document.getElementById('test');
    p.addEventListener('click', function () {
        myMap._OnOnce({
            obj: myMap.gMap,
            event: 'click',
            callback: function () {
                alert('clicked');
            }
        })
    })

})(window ,window.Codepros);