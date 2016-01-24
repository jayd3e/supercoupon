$(function() {

    var FeaturedListingsView = Backbone.View.extend({
        events: {
            'click li': 'click'
        },
        initialize: function() {
            _.bindAll(this, 'slide_right', 'slide_left', 'toggle_arrows');

            /* Cached Elements */
            this.arrow_left_el = this.$el.children('.js-arrow-left');
            this.arrow_right_el = this.$el.children('.js-arrow-right');
            this.listings_wrap_el = this.$el.children('.js-featured-listings-wrap');
            this.listings_el = this.listings_wrap_el.children('.js-featured-listings');

            /* Events */
            this.arrow_left_el.click(this.slide_left);
            this.arrow_right_el.click(this.slide_right);
            this.listings_wrap_el.scroll(this.toggle_arrows);
        },
        slide_right: function() {
            this.listings_wrap_el.animate({
                'scrollLeft': '+=650px'
            }, 200, this.toggle_arrows);
        },
        slide_left: function() {
            this.listings_wrap_el.animate({
                'scrollLeft': '-=650px'
            }, 200, this.toggle_arrows);
        },
        toggle_arrows: function() {
            var scroll_left = this.listings_wrap_el.scrollLeft();

            /* determine what should be shown */
            if (scroll_left <= 0) {
                this.arrow_right_el.show();
            }
            else if (scroll_left > 0) {
                this.arrow_left_el.show();
            }

            /* determine what should be hidden */
            if (scroll_left <= 0) {
                this.arrow_left_el.hide();
            }
            else if (scroll_left >= this.listings_el.width() - this.listings_wrap_el.width()) {
                this.arrow_right_el.hide();
            }
        },
        click: function(e) {
            window.location.replace($(e.currentTarget).data('url'));
        }
    });

    var ListingModel = Backbone.Model.extend();

    var ListingsView = Backbone.View.extend({
        initialize: function() {
            /* Vars */
            this.listing_views = [];

            /* Cached Elements */
            this.listing_els = this.$el.children('li');

            /* Create all of the ListingViews */
            _.each(this.listing_els, function(listing_el) {
                var model = new ListingModel($(listing_el).data());
                var listing_view = new ListingView({
                    'el': listing_el,
                    'model': model
                });
                this.listing_views.push(listing_view);
            }, this);
        }
    });

    var ListingView = Backbone.View.extend({
        initialize: function() {
            _.bindAll(this, 'click');

            /* Events */
            this.$el.click(this.click);
        },
        click: function() {
            window.location.replace(this.model.get('url'));
        }
    });

    var featured_listings_view = new FeaturedListingsView({
        'el': $('.js-featured')
    });
    var listings_view = new ListingsView({
        'el': $('.js-listings-wrap .js-listings')
    });
});