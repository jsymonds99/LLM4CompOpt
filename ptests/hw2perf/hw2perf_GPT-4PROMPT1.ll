; ModuleID = 'hw2perf_unoptimized.ll'
source_filename = "hw2perf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [1000 x i64], align 16
  %2 = alloca [1000 x i64], align 16
  %3 = alloca [1000 x i64], align 16
  %4 = alloca [1000 x i64], align 16
  br label %5

5:                                                ; preds = %0, %5
  %6 = phi i32 [ 0, %0 ], [ %16, %5 ]
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %7
  store i64 %7, ptr %8, align 8
  %9 = shl nuw nsw i32 %6, 1
  %10 = zext i32 %9 to i64
  %11 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %7
  store i64 %10, ptr %11, align 8
  %12 = mul nsw i32 %6, 3
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %7
  store i64 %13, ptr %14, align 8
  %15 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %7
  store i64 0, ptr %15, align 8
  %16 = add nuw nsw i32 %6, 1
  %17 = icmp ult i32 %6, 999
  br i1 %17, label %5, label %18, !llvm.loop !6

18:                                               ; preds = %5
  call void @srand(i32 noundef 4) #3
  br label %19

19:                                               ; preds = %18, %99
  %20 = phi i32 [ 0, %18 ], [ %104, %99 ]
  %21 = phi i32 [ 5, %18 ], [ %103, %99 ]
  %22 = phi i32 [ 15, %18 ], [ %102, %99 ]
  %23 = phi i32 [ 0, %18 ], [ %101, %99 ]
  %24 = phi i32 [ 0, %18 ], [ %100, %99 ]
  %25 = sext i32 %21 to i64
  %26 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %25
  %27 = load i64, ptr %26, align 8
  %28 = mul i64 %27, 87
  %29 = sdiv i64 %28, 4
  %30 = add nsw i64 %29, 23
  %31 = sext i32 %22 to i64
  %32 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %31
  %33 = load i64, ptr %32, align 8
  %34 = mul i64 %33, 231
  %35 = sdiv i64 %34, 3
  %36 = add nsw i64 %35, 59
  %37 = add nsw i64 %36, %30
  %38 = srem i64 %37, 1000
  %39 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %38
  %40 = load i64, ptr %39, align 8
  %41 = load i64, ptr %26, align 8
  %42 = add nsw i64 %41, %40
  %43 = load i64, ptr %32, align 8
  %44 = add nsw i64 %42, %43
  %45 = mul nsw i64 %30, 11
  %46 = mul nsw i64 %36, 13
  %47 = mul nsw i64 %44, 17
  %48 = zext i32 %20 to i64
  %49 = add i64 %45, %48
  %50 = add i64 %49, %46
  %51 = add i64 %50, %47
  %52 = urem i32 %20, 1000
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %53
  store i64 %51, ptr %54, align 8
  %55 = icmp ult i32 %20, 100
  br i1 %55, label %56, label %99

56:                                               ; preds = %19, %56
  %57 = phi i32 [ %92, %56 ], [ 0, %19 ]
  %58 = phi i32 [ %spec.select, %56 ], [ %23, %19 ]
  %59 = phi i32 [ %spec.select, %56 ], [ %24, %19 ]
  %60 = sext i32 %58 to i64
  %61 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %60
  %62 = load i64, ptr %61, align 8
  %63 = mul nsw i64 %62, 6
  %64 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %60
  %65 = load i64, ptr %64, align 8
  %66 = sdiv i64 %65, 2
  %67 = add nsw i64 %66, %63
  %68 = srem i64 %67, 1000
  %69 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %68
  %70 = load i64, ptr %69, align 8
  %71 = shl nsw i64 %70, 1
  %72 = shl nsw i64 %62, 2
  %73 = add nsw i64 %71, %72
  %74 = srem i64 %73, 1000
  %75 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %74
  %76 = load i64, ptr %75, align 16
  %77 = mul nsw i64 %76, 6
  %78 = sext i32 %59 to i64
  %79 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %78
  %80 = load i64, ptr %79, align 8
  %81 = mul nsw i64 %80, 3
  %82 = add nsw i64 %81, %77
  %83 = mul nsw i64 %82, 2
  %84 = zext i32 %57 to i64
  %85 = add i64 %67, %84
  %86 = add i64 %85, %73
  %87 = add i64 %86, %83
  %88 = urem i32 %57, 100
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %89
  store i64 %87, ptr %90, align 8
  %91 = icmp ult i32 %57, 10
  %spec.select = select i1 %91, i32 59, i32 %59
  %92 = add nuw nsw i32 %57, 1
  %93 = icmp ult i32 %57, 999999
  br i1 %93, label %56, label %94, !llvm.loop !8

94:                                               ; preds = %56
  %95 = icmp eq i32 %20, 0
  br i1 %95, label %96, label %99

96:                                               ; preds = %94
  %97 = call i32 @rand() #3
  %98 = srem i32 %97, 1000
  br label %99

99:                                               ; preds = %96, %94, %19
  %100 = phi i32 [ %24, %19 ], [ %spec.select, %94 ], [ %spec.select, %96 ]
  %101 = phi i32 [ %23, %19 ], [ %spec.select, %94 ], [ %spec.select, %96 ]
  %102 = phi i32 [ %22, %19 ], [ %22, %96 ], [ 37, %94 ]
  %103 = phi i32 [ %21, %19 ], [ %98, %96 ], [ %21, %94 ]
  %104 = add nuw nsw i32 %20, 1
  %105 = icmp ult i32 %20, 999999999
  br i1 %105, label %19, label %106, !llvm.loop !9

106:                                              ; preds = %99, %106
  %107 = phi i32 [ %112, %106 ], [ 0, %99 ]
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %108
  %110 = load i64, ptr %109, align 8
  %111 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i64 noundef %110) #3
  %112 = add nuw nsw i32 %107, 1
  %113 = icmp ult i32 %107, 999
  br i1 %113, label %106, label %114, !llvm.loop !10

114:                                              ; preds = %106
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
