require 'gtk3'
include Gtk

load "Interfaces/Fenetre.rb"

=begin

    La classe FenetreRegle :::
        - permet de générer l'interface "Regle" du jeu

    Les VI de la classe sont :::
        - @builder      ==> builder contenant la fenêtre courante (ici la fenêtre "regle")
        - @object       ==> contient l'identifiant de l'interface
        - @btnRetour    ==> contient l'identifiant du bouton retour
        - @menuParent   ==> contient le fenêtre parente de la fenêtre courante

=end

class FenetreRegle < Fenetre

    attr_accessor :object

    def initialize(menuParent)
        self.initialiseToi

        @builder = Gtk::Builder.new(:file => 'glade/regles.glade')
        @object = @builder.get_object("menu")

        @btnRetour = @builder.get_object("btn_retour")

        @menuParent = menuParent

        self.gestionSignaux
    end

    def gestionSignaux()
        @btnRetour.signal_connect( "clicked" ) {
            self.changerInterface(@menuParent, "Menu")
        }
    end
end