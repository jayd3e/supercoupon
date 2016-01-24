<%def name="render_header()">
    <header class="header">
        <div class="container">
            <a href="${ request.route_url('index') }" class="logo">SuperCoupon</a>
            <ol class="navigation">
                <li>
                    <a href="${ request.route_url('about') }">About</a>
                </li>
                <li>
                    <a href="https://twitter.com/supercouponco">Twitter</a>
                </li>
                <li>
                    <a href="${ request.route_url('coupons') }" class="button">
                        How do these coupons work?
                    </a>
                </li>
            </ol>
        </div>
    </header>
</%def>
