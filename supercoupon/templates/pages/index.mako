<%inherit file="supercoupon:templates/layouts/base.mako" />
<%namespace file="supercoupon:templates/partials/data.mako" name="data_tmpl" />

<%def name="page()">
    <ol class="alerts">
        <li class="alert alert-warning">
            In order to receive any of the discounts listed on this site, you will need to own
            some bitcoin.  If you're not sure what Bitcoin is, you can read more here.  If you
            just want to know how to buy some bitcoin, then go grab a wallet here.
        </li>
    </ol>

    <section class="featured js-featured">
        <a href="#" class="featured-arrow-previous js-arrow-left">
            <i class="icon-chevron-thin-left"></i>
        </a>
        <div class="featured-listings-wrap js-featured-listings-wrap">
            <ol class="featured-listings js-featured-listings">
            % for listing in featured:
                <li class="featured-listing" ${ data_tmpl.render_data(listing) }>
                    <div class="featured-listing-image"
                         style="background-image: url(${ request.static_url('supercoupon:static/img/%s' % listing.image_url) });"></div>
                    <h1 class="featured-listing-header">
                        ${ listing.title }
                    </h1>
                    <a class="featured-listing-url" href="${ listing.url }">${ listing.url }</a>
                    <p class="featured-listing-description">${ listing.description }</p>
                </li>
            % endfor
            </ol>
        </div>
        <a href="#" class="featured-arrow-next js-arrow-right">
            <i class="icon-chevron-thin-right"></i>
        </a>
    </section>

    <section class="listings-wrap js-listings-wrap">
        <ol class="categories">
            <li class="active">
                <a href="${ request.route_url('index') }">All Coupons</a>
            </li>
            <li>
                <a href="${ request.route_url('index', _query={'category': 7}) }">Services</a>
            </li>
            <li>
                <a href="${ request.route_url('index', _query={'category': 6}) }">Electronics</a>
            </li>
        </ol>

        <ol class="listings js-listings">
        % for listing in listings:
            <li class="listing" ${ data_tmpl.render_data(listing) }>
                <div class="listing-left">
                    <div class="listing-offer">
                        <span class="listing-offer-discount">${ listing.discount }</span></br>
                        OFF
                    </div>
                </div>
                <div class="listing-content">
                    <h1 class="listing-header">${ listing.title }</h1>
                    <a class="listing-url" href="${ listing.url }">${ listing.url }</a>
                    <p class="listing-description">${ listing.description }</p>
                </div>
            </li>
        % endfor
        </ol>
    </section>
</%def>
