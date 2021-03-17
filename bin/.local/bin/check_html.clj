#!/usr/bin/env bb

(require '[babashka.curl :as curl]
         '[clojure.java.shell :refer [sh]] )

(defn get-url [url]
  (println "Downloading url:" url)
  (curl/get url))

(defn write-html [file html]
  (println "Writing file:" file)
  (spit file html))

(defn check-html-body-for-equality [])

(let [[url file] *command-line-args*]
  (when (or (empty? url) (empty? file))
    (println "Usage: <url> <file>")
    (System/exit 1))
  (loop [downloaded-body (:body (get-url url))
        file-exists (.exists (io/file file))]
        (cond
          (= true file-exists) (if (= downloaded-body (slurp file))
                                     (do
                                       (println (.toString (java.time.LocalDateTime/now)) "webpage did not change")
                                       (Thread/sleep 60000)
                                       (recur
                                         (:body (get-url url))
                                         (.exists (io/file file))))
                                     (do
                                       (println "webpage HAS CHANGED")
                                       (sh "osascript" "-e" "tell application \"Messages\" to send \"Webpage changed\" to buddy \"0674817097\"")
                                       (sh "terminal-notifier" "-message" "webpage has changed")
                                       (write-html file downloaded-body)))
          :else (write-html file downloaded-body))
    ))
