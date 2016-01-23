<%inherit file="supercoupon:templates/layouts/base.mako" />

<%def name="page()">
    <section class="featured">
        <ol class="featured-listings">
        % for listing in featured:
            <li class="featured-listing">
                <img class="featured-listing-image" src="" />
                <h1>
                    ${ listing.title }
                    <span class="featured-listing-discount">${ listing.discount }% off</span>
                </h1>
                <p>${ listing.description }</p>
            </li>
        % endfor
        </ol>
    </section>
    <section class="listings-wrap">
        <ol class="listings">
        % for listing in listings:
            <li class="listing">
                <div class="listing-left">
                    ${ listing.discount }% off
                </div>
                <div class="listing-content">
                    <h1>${ listing.title }</h1>
                    <p>${ listing.description }</p>
                </div>
            </li>
        % endfor
        </ol>
    </section>
</%def>