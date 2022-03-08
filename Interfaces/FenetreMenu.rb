require 'gtk3'

load "Interfaces/FenetreProfil.rb"
load "Interfaces/FenetreLibre.rb"
load "Interfaces/FenetreParametre.rb"
load "Interfaces/FenetreAPropos.rb"
load "Interfaces/Fenetre.rb"
load "Sauvegarde/Profil.rb"

#load "Aventure/AffichageAventure.rb"

class FenetreMenu < Fenetre

    attr_accessor :profil, :quit
    def initialize
        self.initialiseToi
        @builder = Gtk::Builder.new(:file => 'glade/menu.glade')
        @object = @builder.get_object("menu")

        

        @interfaceAPropos = FenetreAPropos.new
        @interfaceLibre = FenetreLibre.new
        #@interfaceAventure = AffichageAventure.new
        @interfaceProfil = FenetreProfil.new
        @interfaceParametre = FenetreParametre.new

        #On récupere le profil séléctionné par le joueur.
        @interfaceProfil.afficheToi
        @profil = @interfaceProfil.profil

        #Ici on vérifie si le joueur souhaite quitter le jeu en etant sur la fenêtre du choix de profil.
        @quit = false
        if @interfaceProfil.quit
            @quit = true
        end

        print "\ntu initialise l'interface menu\n"
        
    end


    def afficheToi
        print "profil = #{@profil}\n"
    
        #Recuperation des variables bouton
        btn_libre = @builder.get_object("btn_libre")
        btn_survie = @builder.get_object("btn_survie")
        btn_contre_montre = @builder.get_object("btn_contre_montre")
        btn_aventure = @builder.get_object("btn_aventure")
        btn_tuto = @builder.get_object("btn_tuto")
        btn_propos = @builder.get_object("btn_propos")
        btn_parametre = @builder.get_object("btn_parametre")

        #Gestion des signaux
        btn_libre.signal_connect('clicked') {
            self.remove(@object)
            @interfaceLibre.afficheToi
            self.remove(@interfaceLibre.object)
            self.affichage
        }

        btn_survie.signal_connect('clicked') {print "tu as clique sur le mode survie\n"}

        btn_contre_montre.signal_connect('clicked') {print "tu as clique sur le mode contre la montre\n"}

        btn_aventure.signal_connect('clicked') {print "tu as clique sur le mode Aventure\n"}

        btn_tuto.signal_connect('clicked') {print "tu as clique sur le mode tuto\n"}

        btn_propos.signal_connect('clicked') {print "tu as clique sur a propos\n"}

        btn_parametre.signal_connect('clicked') {
            self.deleteChildren()
            #@interfaceParametre.afficheToi
            #self.affichage
        }

        self.affichage
    end

    def affichage
        super(@object, "Menu")
    end
end