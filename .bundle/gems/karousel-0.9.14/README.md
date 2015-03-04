Karousel
========

[![Gem Version][1]][2]
[![Continuous Integration Status][3]][4]
[![Coverage Status][5]][6]
[![CodePolice][7]][8]
[![Dependency Status][9]][10]


Karousel is an intelligent, client-side job dispenser that accesses a
parallelized service without overloading its queue. It dishes out jobs 
onto a defined number of 'seats' on the 'karousel', tosses out completed 
jobs, and refills empty 'seats' with new jobs. As a result, the queue on 
the parallelized service remains lean and clients make responsible use 
of the service.

Principle of operation
----------------------

The gem works on a carousel principle. Jobs are loaded onto a carousel-like 
object. The size of the 'karousel' (i.e. its 'seats') determines how 
many objects are active at any given time. For example, if the size of 
the 'karousel' is 20, only 20 objects at a time will access the service.

Karousel loads all jobs, initiates its rotation, and sends each job in 
succession to a service. For each new job, 'karousel' waits for an 'OK' 
from the service, captures the status of the job and optionally stores the 
response from the service. Starting with the oldest submitted job, 
'karousel' checks to see if the job is finished. If it is finished, it is 
processed, removed from the 'karousel', and the seat is freed for a new job. 
After a rotation of the 'karousel' empty seats are filled with new jobs and 
the 'karousel' continues to rotate.

Installation
------------

    gem install karousel

Usage
-----

Given a Karousel-compatible job class (e.g. KarouselJob) the usage is:

    require 'karousel'
    karousel = Karousel.new(KarouselJob, 20, 5)
    karousel.run

where KarouselJob is the name of your job class, 20 is number of 'seats' 
on your 'karousel', and 5 is the time interval in seconds between complete 
rotations of the 'karousel'.

You can optionally supply a block to the 'run' method to perform your own 
logging, collect data, or other uses. For example:

    count = 0
    karousel.run { puts count += 1 }

or

    result = []
    karousel.run { result << karousel.cycle_data }

How to write a Job Class
------------------------

A Job class requires the following signature:

    class MyJob < Karousel::ClientJob

      def self.populate(number_of_seats)
        ... # returns an array of the karousel size 
            # (number_of_seats would be 20 in our example)
      end

      def send
        ... # sends the job to the service, returns true if it 
            # receives an expected response, false otherwise
      end

      def finished?
        ... # returns true if job is done, false otherwise
      end

      def process
        ... # processes the finished job
      end

    end

You can also check out an [example file][11] or [example project][12]

Versioning
----------

This gem is following practices of [Semantic Versioning][13]

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Copyright
---------

Authors: [Dmitry Mozzherin][14], [David Shorthouse][15] 

Copyright (c) 2012-2013 Marine Biological Laboratory. See LICENSE for
further details.

[1]: https://badge.fury.io/rb/karousel.png
[2]: http://badge.fury.io/rb/karousel
[3]: https://secure.travis-ci.org/GlobalNamesArchitecture/karousel.png
[4]: http://travis-ci.org/GlobalNamesArchitecture/karousel
[5]: https://coveralls.io/repos/GlobalNamesArchitecture/karousel/badge.png?branch=master
[6]: https://coveralls.io/r/GlobalNamesArchitecture/karousel?branch=master
[7]: https://codeclimate.com/github/GlobalNamesArchitecture/karousel.png
[8]: https://codeclimate.com/github/GlobalNamesArchitecture/karousel
[9]: https://gemnasium.com/GlobalNamesArchitecture/karousel.png
[10]: https://gemnasium.com/GlobalNamesArchitecture/karousel
[11]: https://github.com/GlobalNamesArchitecture/karousel/blob/master/spec/support/client_job_dummy.rb
[12]: https://github.com/GlobalNamesArchitecture/karousel
[13]: http://semver.org/
[14]: https://github.com/dimus
[15]: https://github.com/dshorthouse
