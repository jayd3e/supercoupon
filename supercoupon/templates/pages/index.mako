<%inherit file="supercoupon:templates/layouts/base.mako" />

<%def name="page()">
    <section class="featured">
        <ol class="featured-listings">
        % for listing in range(10):
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
    </section>
    <section class="listings-wrap">
        <ol class="listings">
        % for listing in range(10):
            <li class="listing">
                <div class="listing-left">
                    20% off
                </div>
                <div class="listing-content">
                    <h1>Title Name</h1>
                    <p>This is a description.</p>
                </div>
            </li>
        % endfor
        </ol>
    </section>
</%def>