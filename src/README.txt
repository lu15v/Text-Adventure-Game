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

The logical view contains information about the various parts of the system. In UML the logical view is typically modelled using <em>class diagrams</em>.

For example, the following figure represents the UML class diagram for the +Greeter+ model and its factory class:

link:../images/class_diagram.png

You can include as many of these diagrams as you consider necessary. Note that you only need to specify the names of the classes and their relationships. Don't include attributes or method names in these diagrams.

To include an image in this document, copy it to the +images+ directory and refer it as: +link:../images/some_image.png+. You can use any web supported image format (PNG, JPEG, GIF, etc.).

=== Process View

The process view describes the concurrent processes within the system. In UML, <em>activity diagrams</em> are used to model this view.

=== Development View
The development view focusses on software modules and subsystems. In UML, <em>package diagrams</em> are used to model the development view.

=== Physical View

The physical view describes the physical deployment of the system, revealing which pieces of software run on what pieces of hardware. In UML, <em>deployment diagrams</em> are used to model the physical view.

For example, this is the deployment diagram for our application:

link:../images/deployment_diagram.png

=== Scenarios
This view describes the functionality of the system from the perspective from outside world. It contains diagrams describing what the system is supposed to do from a black box perspective. UML <em>use case diagrams</em> are used for this view.

== Patterns Used

Briefly mention all the patterns that your application uses and identify where exactly. In our example, the following pattern are clearly used:

- <b>Domain-Specific Language</b>: The +server.rb+ file consists of a series of Sinatra _routes_. Sinatra is a DSL for creating web applications in Ruby.
- <b>Model-View-Controller</b>: The application follows the classical web implementation of the MVC architectural pattern. The models (+.rb+ files) and views (+.erb+ files) are stored in the corresponding +models+ and +views+ directory. The controller is contained in +server.rb+ file.
- <b>Simple Factory</b>: The +GreeterFactory+ is used to create +Greeter+ instances by specifying the desired language during its creation.

== Acknowledgments

This section is optional. If somebody helped you with your project make sure to include her or his name here.

== References

Mention here any consulted books or web resources. Examples:

- \M. Fowler. <em>UML Distilled: A Brief Guide to the Standard Object Modeling Language, 3rd Edition.</em>  Addison-Wesley, 2003. Available through {Safari Books Online}[http://proquestcombo.safaribooksonline.com/book/software-engineering-and-development/uml/0321193687].

- \E. Gamma, R. Helm, R. Johnson, J. M. Vlissides. <em>Design Patterns: Elements of Reusable Object-Oriented Software.</em> Addison-Wesley, 1994. Available through {Safari Books Online}[http://proquestcombo.safaribooksonline.com/book/software-engineering-and-development/patterns/0201633612].

- \A. Harris, K. Haase. <em>Sinatra: Up and Running.</em> O'Reilly, 2011. {Safari Books Online}[http://proquestcombo.safaribooksonline.com/book/web-development/ruby/9781449306847].

- \Ph. Kruchten. <em>The 4+1 View Model of Architecture.</em> IEEE Software, vol. 12 (6), pp. 45-50, 1995. {\http://www.ics.uci.edu/~andre/ics223w2006/kruchten3.pdf}[http://www.ics.uci.edu/~andre/ics223w2006/kruchten3.pdf] Accessed April 14, 2016.

- \R. Olsen. <em>Design Patterns in Ruby.</em> Addison-Wesley, 2007. Available through {Safari Books Online}[http://proquestcombo.safaribooksonline.com/book/web-development/ruby/9780321490452].

- Ruby-Doc.org. <em>RDoc Markup Reference.</em> {\http://ruby-doc.org/stdlib-2.2.3/libdoc/rdoc/rdoc/RDoc/Markup.html}[http://ruby-doc.org/stdlib-2.2.3/libdoc/rdoc/rdoc/RDoc/Markup.html#class-RDoc::Markup-label-Block+Markup] Accessed April 14, 2016.
