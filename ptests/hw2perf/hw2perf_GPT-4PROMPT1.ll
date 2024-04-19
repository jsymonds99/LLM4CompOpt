; ModuleID = 'hw2perf_unoptimized.ll'
source_filename = "hw2perf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
.lr.ph:
  %0 = alloca [1000 x i64], align 16
  %1 = alloca [1000 x i64], align 16
  %2 = alloca [1000 x i64], align 16
  %3 = alloca [1000 x i64], align 16
  br label %4

4:                                                ; preds = %.lr.ph, %4
  %5 = phi i32 [ 0, %.lr.ph ], [ %15, %4 ]
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds [1000 x i64], ptr %0, i64 0, i64 %6
  store i64 %6, ptr %7, align 8
  %8 = shl nuw nsw i32 %5, 1
  %9 = zext i32 %8 to i64
  %10 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %6
  store i64 %9, ptr %10, align 8
  %11 = mul nsw i32 %5, 3
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %6
  store i64 %12, ptr %13, align 8
  %14 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %6
  store i64 0, ptr %14, align 8
  %15 = add nuw nsw i32 %5, 1
  %16 = icmp ult i32 %5, 999
  br i1 %16, label %4, label %.lr.ph5, !llvm.loop !6

.lr.ph5:                                          ; preds = %4
  call void @srand(i32 noundef 4) #3
  br label %17

17:                                               ; preds = %.lr.ph5, %95
  %18 = phi i32 [ 0, %.lr.ph5 ], [ %96, %95 ]
  %19 = phi i32 [ 0, %.lr.ph5 ], [ %97, %95 ]
  %20 = phi i32 [ 0, %.lr.ph5 ], [ %100, %95 ]
  %21 = phi i32 [ 15, %.lr.ph5 ], [ %98, %95 ]
  %22 = phi i32 [ 5, %.lr.ph5 ], [ %99, %95 ]
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [1000 x i64], ptr %0, i64 0, i64 %23
  %25 = load i64, ptr %24, align 8
  %26 = mul i64 %25, 87
  %27 = sdiv i64 %26, 4
  %28 = add nsw i64 %27, 23
  %29 = sext i32 %21 to i64
  %30 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %29
  %31 = load i64, ptr %30, align 8
  %32 = mul i64 %31, 231
  %33 = sdiv i64 %32, 3
  %34 = add nsw i64 %33, 59
  %35 = add nsw i64 %34, %28
  %36 = srem i64 %35, 1000
  %37 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %36
  %38 = load i64, ptr %37, align 8
  %39 = load i64, ptr %24, align 8
  %40 = add nsw i64 %39, %38
  %41 = load i64, ptr %30, align 8
  %42 = add nsw i64 %40, %41
  %43 = mul nsw i64 %28, 11
  %44 = mul nsw i64 %34, 13
  %45 = mul nsw i64 %42, 17
  %46 = zext i32 %20 to i64
  %47 = add i64 %43, %46
  %48 = add i64 %47, %44
  %49 = add i64 %48, %45
  %50 = urem i32 %20, 1000
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %51
  store i64 %49, ptr %52, align 8
  %53 = icmp ult i32 %20, 100
  br i1 %53, label %.lr.ph2, label %95

.lr.ph2:                                          ; preds = %17, %.lr.ph2
  %54 = phi i32 [ %89, %.lr.ph2 ], [ 0, %17 ]
  %55 = phi i32 [ %spec.select, %.lr.ph2 ], [ %18, %17 ]
  %56 = phi i32 [ %spec.select, %.lr.ph2 ], [ %19, %17 ]
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %57
  %59 = load i64, ptr %58, align 8
  %60 = mul nsw i64 %59, 6
  %61 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %57
  %62 = load i64, ptr %61, align 8
  %63 = sdiv i64 %62, 2
  %64 = add nsw i64 %63, %60
  %65 = srem i64 %64, 1000
  %66 = getelementptr inbounds [1000 x i64], ptr %0, i64 0, i64 %65
  %67 = load i64, ptr %66, align 8
  %68 = shl nsw i64 %67, 1
  %69 = shl nsw i64 %59, 2
  %70 = add nsw i64 %68, %69
  %71 = srem i64 %70, 1000
  %72 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %71
  %73 = load i64, ptr %72, align 16
  %74 = mul nsw i64 %73, 6
  %75 = sext i32 %55 to i64
  %76 = getelementptr inbounds [1000 x i64], ptr %0, i64 0, i64 %75
  %77 = load i64, ptr %76, align 8
  %78 = mul nsw i64 %77, 3
  %79 = add nsw i64 %78, %74
  %80 = mul nsw i64 %79, 2
  %81 = zext i32 %54 to i64
  %82 = add i64 %64, %81
  %83 = add i64 %82, %70
  %84 = add i64 %83, %80
  %85 = urem i32 %54, 100
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %86
  store i64 %84, ptr %87, align 8
  %88 = icmp ult i32 %54, 10
  %spec.select = select i1 %88, i32 59, i32 %55
  %89 = add nuw nsw i32 %54, 1
  %90 = icmp ult i32 %54, 999999
  br i1 %90, label %.lr.ph2, label %._crit_edge3, !llvm.loop !8

._crit_edge3:                                     ; preds = %.lr.ph2
  %91 = icmp eq i32 %20, 0
  br i1 %91, label %92, label %95

92:                                               ; preds = %._crit_edge3
  %93 = call i32 @rand() #3
  %94 = srem i32 %93, 1000
  br label %95

95:                                               ; preds = %92, %._crit_edge3, %17
  %96 = phi i32 [ %18, %17 ], [ %spec.select, %._crit_edge3 ], [ %spec.select, %92 ]
  %97 = phi i32 [ %19, %17 ], [ %spec.select, %._crit_edge3 ], [ %spec.select, %92 ]
  %98 = phi i32 [ %21, %17 ], [ %21, %92 ], [ 37, %._crit_edge3 ]
  %99 = phi i32 [ %22, %17 ], [ %94, %92 ], [ %22, %._crit_edge3 ]
  %100 = add nuw nsw i32 %20, 1
  %101 = icmp ult i32 %20, 999999999
  br i1 %101, label %17, label %.lr.ph8, !llvm.loop !9

.lr.ph8:                                          ; preds = %95, %.lr.ph8
  %102 = phi i32 [ %107, %.lr.ph8 ], [ 0, %95 ]
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %103
  %105 = load i64, ptr %104, align 8
  %106 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i64 noundef %105) #3
  %107 = add nuw nsw i32 %102, 1
  %108 = icmp ult i32 %102, 999
  br i1 %108, label %.lr.ph8, label %._crit_edge9, !llvm.loop !10

._crit_edge9:                                     ; preds = %.lr.ph8
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
