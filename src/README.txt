= Application Design and Architecture

Authors::    Luis Ballinas, Fernando Gómez
Date::       May 5, 2016

The directory structure for the application and its documentation is as follows:

   game/
         ├─ doc/                        Folder produced by RDoc.
         ├─ images/                     Folder for the documentation's image files.
         └─ src/                        Folder for the application's source code.
              ├─ db/                    Folder for the initial database records
              ├─ public/                Folder for the server's public documents.
              │       └─ css/           Folder for the application's CSS files.
              │       └─ fonts/         Folder for the application's font files.
              │       └─ img/           Folder for the application's asset image files.
              │       └─ js/            Folder for the application's client-JS files.
              ├─ models/                Folder for the application's models.
              ├       |_ states/                Folder for the application's state models.
              └─ views/                 Folder for the application's views (ERB files).
         └─ Rakefile                    Rake tasks for run the server, seed the DB, and generate the documentation
         └─ Gemfile                     Application dependencies managed by Bundler

== Installing and Running the Application
To run the application, you must first install the necessary dependencies. You can do this
by running the following command:
  bundle install

Next, you have to seed the database using the following command:
  rake seed

Finally you can start the application with:
  rake server (or just rake)

Afterwards, point your web brower at the following URL: +http://localhost:4567/+

== Documentation
This is the command used to produce this documentation (running it from the +game+ directory):

  rake doc

The root of the documentation should now be available at: +game/doc/index.html+


== 4+1 Architectural View Model

You must use Philippe Kruchten's <b>“4+1 View Model”</b> to document your application's architecture. I suggest using the {draw.io}[https://www.draw.io/] site to produce the required UML diagrams.

=== Logical View

link:../images/UML.png

=== Process View

link:../images/AD.png

==== State Diagram

link:../images/stateDiagram.png

=== Development View
link:../images/package_diagram.png

=== Physical View

link:../images/DeploymentDiagram.png

=== Scenarios
link:../images/UseCases.png

== Patterns Used

Briefly mention all the patterns that your application uses and identify where exactly. In our example, the following pattern are clearly used:

- <b>Domain-Specific Language</b>: The +server.rb+ file consists of a series of Sinatra _routes_. Sinatra is a DSL for creating web applications in Ruby.
- <b>Model-View-Controller</b>: The application follows the classical web implementation of the MVC architectural pattern. The models (+.rb+ files) and views (+.erb+ files) are stored in the corresponding +models+ and +views+ directory. The controller is contained in +server.rb+ file.
- <b>Composite Pattern</b>: The +Game+ can has many player running the game at the same time.
- <b>State Pattern</b>: All the +States+ implement this pattern in order to change between them  and with this, the functionality of the game.
== References

Mention here any consulted books or web resources. Examples:

- \A. Harris, K. Haase. <em>Sinatra: Up and Running.</em> O'Reilly, 2011. {Safari Books Online}[http://proquestcombo.safaribooksonline.com/book/web-development/ruby/9781449306847].

- \Ph. Kruchten. <em>The 4+1 View Model of Architecture.</em> IEEE Software, vol. 12 (6), pp. 45-50, 1995. {\http://www.ics.uci.edu/~andre/ics223w2006/kruchten3.pdf}[http://www.ics.uci.edu/~andre/ics223w2006/kruchten3.pdf] Accessed April 14, 2016.

- Ruby-Doc.org. <em>RDoc Markup Reference.</em> {\http://ruby-doc.org/stdlib-2.2.3/libdoc/rdoc/rdoc/RDoc/Markup.html}[http://ruby-doc.org/stdlib-2.2.3/libdoc/rdoc/rdoc/RDoc/Markup.html#class-RDoc::Markup-label-Block+Markup] Accessed April 14, 2016.
