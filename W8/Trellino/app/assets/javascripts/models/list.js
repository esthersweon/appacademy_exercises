Trellino.Models.List = Backbone.Model.extend({

	initialize: function() {
		
	},

	cards: function() {
		if(!this._cards){
			this._cards = new Trellino.Collections.Cards([], {
				list: this
			});
		}
		return this._cards;
	},

	parse: function(response){
		if(response.cards){
			this.cards().set(response.cards);
			delete response.cards;
		}
		return response;
	}
});