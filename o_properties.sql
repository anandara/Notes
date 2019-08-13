--join and huge data
set hive.auto.convert.join=true;
set hive.map.aggr=true;
set hive.exec.compress.output=true;
set hive.exec.compress.intermediate=true;
set hive.vectorized.execution.enabled = true;
SET hive.exec.dynamic.partition=true;
set hive.exec.parallel=true;
set hive.auto.convert.sortmerge.join.bigtable.selection.policy=org.apache.hadoop.hive.ql.optimizer.TableSizeBasedBigTableSelectorForAutoSMJ;
SET mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec;
SET mapred.output.compression.type=BLOCK;
SET hive.default.fileformat=Orc;
set hive.merge.size.per.task=134217728;
set hive.merge.smallfiles.avgsize=44739242;
set mapred.reduce.tasks = -1;
set hive.tez.auto.reducer.parallelism = true;
set hive.exec.reducers.bytes.per.reducer = 104857600;
set hive.exec.reducers.max = 292503000;
set hive.cbo.enable=true;
set hive.compute.query.using.stats=true;
set hive.stats.fetch.column.stats=true;
set hive.stats.fetch.partition.stats=true;

--simple join and moderate data
SET hive.exec.dynamic.partition=true;
set hive.exec.parallel=true;
set hive.auto.convert.sortmerge.join.bigtable.selection.policy=org.apache.hadoop.hive.ql.optimizer.TableSizeBasedBigTableSelectorForAutoSMJ;
SET mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec;
SET mapred.output.compression.type=BLOCK;
SET hive.default.fileformat=Orc;
SET hive.exec.dynamic.partition=true;
set hive.tez.auto.reducer.parallelism = true;
set hive.cbo.enable=true;
set hive.compute.query.using.stats=true;
set hive.stats.fetch.column.stats=true;
set hive.stats.fetch.partition.stats=true;

--simple join and less data
set hive.auto.convert.join = true;
set hive.vectorized.execution.enabled=true;
set hive.exec.compress.output=true;
set hive.exec.compress.intermediate=true;
set hive.exec.parallel=true;
set hive.auto.convert.join.noconditionaltask = true;
set hive.auto.convert.join.noconditionaltask.size = 3000000;
set hive.auto.convert.sortmerge.join.bigtable.selection.policy=org.apache.hadoop.hive.ql.optimizer.TableSizeBasedBigTableSelectorForAutoSMJ;

--multiple join and huge data
set yarn.nodemanager.resource.memory-mb  =  20GB; 
set yarn.scheduler.minimum-allocation-mb =   4GB;
set yarn.scheduler.maximum-allocation-mb =  20GB;
set mapreduce.map.memory.mb              =   4GB;
set mapreduce.reduce.memory.mb           =   8GB;
set mapreduce.map.java.opts              = 3.2GB;
set mapreduce.reduce.java.opts           = 6.4GB;
set yarn.app.mapreduce.am.resource.mb    =   8GB;
set yarn.app.mapreduce.am.command-opts   = 6.4GB;

--analytic function with very huge data and merge function for huge data
set hive.execution.engine=mr;
set hive.exec.max.dynamic.partitions=8000;
set hive.exec.max.dynamic.partitions.pernode=8000;
set hive.execution.engine=tez;
set hive.auto.convert.join=true;
set hive.auto.convert.join.noconditionaltask=true;
set hive.auto.convert.join.noconditionaltask.size=405306368;
set hive.vectorized.execution.enabled=true;
set hive.vectorized.execution.reduce.enabled=true;
set hive.cbo.enable=true;
set hive.compute.query.using.stats=true;
set hive.stats.fetch.column.stats=true;
set hive.stats.fetch.partition.stats=true;
set hive.merge.mapfiles=true;
set hive.merge.mapredfiles=true;
set hive.merge.size.per.task=134217728;
set hive.merge.smallfiles.avgsize=44739242;
set mapreduce.job.reduce.slowstart.completedmaps=0.8;

--update for huge data
set hive.execution.engine=tez;
set hive.auto.convert.join=true;
set hive.auto.convert.join.noconditionaltask=true;
set hive.auto.convert.join.noconditionaltask.size=405306368;
set hive.cbo.enable=true;
set hive.compute.query.using.stats=true;
set hive.stats.fetch.column.stats=true;
set hive.stats.fetch.partition.stats=true;
set hive.merge.mapfiles =true;
set hive.merge.mapredfiles=true;
set hive.merge.size.per.task=134217728;
set hive.merge.smallfiles.avgsize=44739242;
set mapreduce.job.reduce.slowstart.completedmaps=0.8;
set hive.vectorized.execution.enabled=false;
set hive.vectorized.execution.reduce.enabled=false;

--old properties used for upadte
set hive.auto.convert.join=true;
set hive.map.aggr=true;
set hive.exec.compress.output=true;
set hive.exec.compress.intermediate=true;
set hive.vectorized.execution.enabled = true;
SET hive.exec.dynamic.partition=true;
set hive.exec.parallel=true;
set hive.auto.convert.sortmerge.join.bigtable.selection.policy=org.apache.hadoop.hive.ql.optimizer.TableSizeBasedBigTableSelectorForAutoSMJ;
SET mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec;
SET mapred.output.compression.type=BLOCK;
SET hive.default.fileformat=Orc;
set hive.merge.size.per.task=134217728;
set hive.merge.smallfiles.avgsize=44739242;
SET hive.exec.dynamic.partition=true;
set mapred.reduce.tasks = -1;
set hive.tez.auto.reducer.parallelism = true;
set hive.exec.reducers.bytes.per.reducer = 104857600;
set hive.exec.reducers.max = 292503000;
set hive.exec.parallel=true;
set hive.cbo.enable=true;
set hive.compute.query.using.stats=true;
set hive.stats.fetch.column.stats=true;
set hive.stats.fetch.partition.stats=true;

--very few data
SET hive.map.aggr = true;
set hive.auto.convert.join = true;
set hive.enforce.bucketing = true;
set tez.auto.reducer.parallelism=true;
set hive.vectorized.execution.enabled=true;
set hive.exec.parallel=true;
set hive.merge.mapfiles=true;
set hive.merge.mapredfiles=true;

--Setting to get the header in Hive Query Result.
set hive.cli.print.header=true;