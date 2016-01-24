<%inherit file="supercoupon:templates/layouts/base.mako" />

<%def name="page()">
    <section class="featured">
        <div class="container">
            <a href="#" class="arrow-next"><img src=""/></a>
            <ol class="featured-listings">
            % for listing in range(3):
                <li class="featured-listing">
                    <img class="featured-listing-image" src="" />
                    <h1>
                        Title Name
                        <span class="featured-listing-discount">20% off</span>
                    </h1>
                    <p>This is a description.</p>
                </li>
            % endfor
            </ol>
            <a href="#" class="arrow-next"><img src=""/></a>
        </div>
    </section>
    <div class="container">
        <section class="listings-wrap">
            <h3 class="section-header">
                <span class="section-header-text">All Coupons</span>
            </h3>
            <ol class="listings">
            % for listing in range(10):
                <li class="listing">
                    <div class="listing-left">
                        <span class="listing-offer">20% OFF</span>
                        <img src="" class="listing-logo"/>
                    </div>
                    <div class="listing-content">
                        <h1 class="listing-header">Company Name</h1>
                        <p class="listing-description">This is the coupon description.</p>
                    </div>
                </li>
            % endfor
            </ol>
        </section>
        <section class="sidebar">
            <h3 class="section-header">
                <span class="section-header-text">Follow our Twitter</span>
            </h3>
            <a class="twitter-timeline" href="https://twitter.com/stompy1208" data-widget-id="691062150358548480">Tweets by @stompy1208</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
        </section>
    </div>
</%def>
